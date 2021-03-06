/* 
 * tsh - A tiny shell program with job control
 * 
 * Sunny Patel - 11721218
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>

/* Misc manifest constants */
#define MAXLINE    1024   /* max line size */
#define MAXARGS     128   /* max args on a command line */
#define MAXJOBS      16   /* max jobs at any point in time */
#define MAXJID    1<<16   /* max job ID */

/* Job states */
#define UNDEF 0 /* undefined */
#define FG 1    /* running in foreground */
#define BG 2    /* running in background */
#define ST 3    /* stopped */

/* 
 * Jobs states: FG (foreground), BG (background), ST (stopped)
 * Job state transitions and enabling actions:
 *     FG -> ST  : ctrl-z
 *     ST -> FG  : fg command
 *     ST -> BG  : bg command
 *     BG -> FG  : fg command
 * At most 1 job can be in the FG state.
 */

/* Global variables */
extern char **environ;      /* defined in libc */
char prompt[] = "tsh> ";    /* command line prompt (DO NOT CHANGE) */
int verbose = 0;            /* if true, print additional output */
int nextjid = 1;            /* next job ID to allocate */
char sbuf[MAXLINE];         /* for composing sprintf messages */
sigset_t maskchild;

struct job_t {              /* The job struct */
	pid_t pid;              /* job PID */
	int jid;                /* job ID [1, 2, ...] */
	int state;              /* UNDEF, BG, FG, or ST */
	char cmdline[MAXLINE];  /* command line */
};
struct job_t jobs[MAXJOBS]; /* The job list */
/* End global variables */


/* Function prototypes */

/* Here are the functions that you will implement */
void eval(char *cmdline);
int builtin_cmd(char **argv, int argc);
void do_bgfg(char **argv, int argc);
void waitfg(pid_t pid);

void sigchld_handler(int sig);
void sigtstp_handler(int sig);
void sigint_handler(int sig);

/* Here are helper routines that we've provided for you */
int parseline(const char *cmdline, char **argv, int *argc_param); 
void sigquit_handler(int sig);

void clearjob(struct job_t *job);
void initjobs(struct job_t *jobs);
int maxjid(struct job_t *jobs); 
int addjob(struct job_t *jobs, pid_t pid, int state, char *cmdline);
int deletejob(struct job_t *jobs, pid_t pid); 
pid_t fgpid(struct job_t *jobs);
struct job_t *getjobpid(struct job_t *jobs, pid_t pid);
struct job_t *getjobjid(struct job_t *jobs, int jid); 
int pid2jid(pid_t pid); 
void listjobs(struct job_t *jobs);

void usage(void);
void unix_error(char *msg);
void app_error(char *msg);
typedef void handler_t(int);
handler_t *Signal(int signum, handler_t *handler);


/* copied from csapp */

pid_t Fork(void)
{   
	int pid=-1;
	if ((pid = fork())<0)
	{
		unix_error("fork error");
		exit(0);
	}
	return pid;
}

int Kill(pid_t pid, int sig)
{
	int ret_val=-1;
	if ((ret_val = kill(pid, sig))<0)
	{        
		unix_error("kill error");
		exit(0);
	}
	return ret_val;
}

pid_t Setpgid(pid_t pid, pid_t pgid)
{
	pid_t ret_val=-1;
	if ((ret_val = setpgid(pid, pgid))<0)
	{
		unix_error("setpgid error");
		exit(0);
	}
	return ret_val;
}
int Sigaddset(sigset_t *set, int signum)
{
	int is_ok;
	if((is_ok=sigaddset(set,signum))<0)
		unix_error("sigaddset error");
	return is_ok;

}

int Sigprocmask(int how, const sigset_t *set, sigset_t *oldset)
{
	int isok=1;
	if((isok=sigprocmask(how,set,oldset))<0)
	{unix_error("sigprocmask error");}
	return isok;

}

int Sigemptyset(sigset_t *set)
{
	int member;
	if((member=sigemptyset(set))<0)
		unix_error("sigemptyset error");
	return member;

}

pid_t Waitpid(pid_t pid, int *status, int options)
{
	pid_t pid_ret = waitpid(pid,status,options);

	if (pid_ret==-1)
	{
		unix_error("waitpid error");
		exit(0);
	}
	return pid_ret;
}

/*
 * main - The shell's main routine 
 */
int main(int argc, char **argv) 
{
	Sigemptyset(&maskchild);
	Sigaddset(&maskchild, SIGCHLD);
	Sigaddset(&maskchild, SIGTSTP);

	char c;
	char cmdline[MAXLINE];
	int emit_prompt = 1; /* emit prompt (default) */

	/* Redirect stderr to stdout (so that driver will get all output
	 * on the pipe connected to stdout) */
	dup2(1, 2);

	/* Parse the command line */
	while ((c = getopt(argc, argv, "hvp")) != EOF) {
		switch (c) {
			case 'h':             /* print help message */
				usage();
				break;
			case 'v':             /* emit additional diagnostic info */
				verbose = 1;
				break;
			case 'p':             /* don't print a prompt */
				emit_prompt = 0;  /* handy for automatic testing */
				break;
			default:
				usage();
		}
	}

	/* Install the signal handlers */

	/* These are the ones you will need to implement */
	Signal(SIGINT,  sigint_handler);   /* ctrl-c */
	Signal(SIGTSTP, sigtstp_handler);  /* ctrl-z */
	Signal(SIGCHLD, sigchld_handler);  /* Terminated or stopped child */

	/* This one provides a clean way to kill the shell */
	Signal(SIGQUIT, sigquit_handler); 

	/* Initialize the job list */
	initjobs(jobs);

	/* Execute the shell's read/eval loop */
	while (1) {

		/* Read command line */
		sleep(0);
		if (emit_prompt) {
			printf("%s", prompt);
			fflush(stdout);
		}
		if ((fgets(cmdline, MAXLINE, stdin) == NULL) && ferror(stdin))
			app_error("fgets error");
		if (feof(stdin)) { /* End of file (ctrl-d) */
			fflush(stdout);
			exit(0);
		}

		/* Evaluate the command line */
		eval(cmdline);
		fflush(stdout);
		fflush(stdout);
	} 

	exit(0); /* control never reaches here */
}

/* 
 * eval - Evaluate the command line that the user has just typed in
 * 
 * If the user has requested a built-in command (quit, jobs, bg or fg)
 * then execute it immediately. Otherwise, fork a child process and
 * run the job in the context of the child. If the job is running in
 * the foreground, wait for it to terminate and then return.  Note:
 * each child process must have a unique process group ID so that our
 * background children don't receive SIGINT (SIGTSTP) from the kernel
 * when we type ctrl-c (ctrl-z) at the keyboard.  
 */
void eval(char *cmdline) 
{
	// init cmdline arguments arry
	char *argv[MAXARGS];

	// parse line and get the number of args
	int argc = 0;
	int isBG = parseline(cmdline, argv, &argc);

	// init. pid for fork
	int pid;

	if (builtin_cmd(argv, argc))
		return;
	Sigprocmask(SIG_BLOCK, &maskchild, NULL);

	// start background process?
	if(isBG){
		pid = Fork();

		// children enter here!
		if(pid == 0){ 
			// put the child process in a new process group ID, workaround the ctrl-c
			// killing all processes in the foreground process group.
			Setpgid(0,0);

			Sigprocmask(SIG_UNBLOCK, &maskchild, NULL);
			Signal(SIGINT, SIG_DFL);
			Signal(SIGTSTP, SIG_DFL);
			if( execv(argv[0], argv) == -1){ // error prob couldnt find command
				printf("%s: Command not found\n", argv[0]);
				exit(0);
			}
			return;
		} // end of child

		addjob( jobs, pid, BG, cmdline);
		struct job_t *job = getjobpid(jobs, pid);
		printf("[%d] (%d) ", job->jid, job->pid);
		printf("%s", job->cmdline);

		// unblock child sigs
		Sigprocmask(SIG_UNBLOCK, &maskchild, NULL);

	} // end of BG
	else { // Fg process
		pid = Fork();
		// children here only!
		if(pid==0){
			// set own process group, same reason as bg process
			Setpgid(0,0);
			// unblock all children sigs
			Sigprocmask(SIG_UNBLOCK, &maskchild, NULL);

			// default signal handlers
			Signal(SIGINT, SIG_DFL);
			Signal(SIGTSTP, SIG_DFL);

			if(execv(argv[0], argv) == -1){
				// cmmand not found!
				printf("%s: Command not found\n", argv[0]);
				exit(0);
			}
		}

		addjob(jobs, pid, FG, cmdline);
		Sigprocmask( SIG_UNBLOCK, &maskchild, NULL);
		waitfg(pid);

		return;
	}



	return;
}  // end of eval

/* 
 * parseline - Parse the command line and build the argv array.
 * 
 * Characters enclosed in single quotes are treated as a single
 * argument.  Return true if the user has requested a BG job, false if
 * the user has requested a FG job.  
 */
int parseline(const char *cmdline, char **argv, int *argc_param) 
{
	static char array[MAXLINE]; /* holds local copy of command line */
	char *buf = array;          /* ptr that traverses command line */
	char *delim;                /* points to first space delimiter */
	int argc;                   /* number of args */
	int bg;                     /* background job? */

	strcpy(buf, cmdline);
	buf[strlen(buf)-1] = ' ';  /* replace trailing '\n' with space */
	while (*buf && (*buf == ' ')) /* ignore leading spaces */
		buf++;

	/* Build the argv list */
	argc = 0;
	if (*buf == '\'') {
		buf++;
		delim = strchr(buf, '\'');
	}
	else {
		delim = strchr(buf, ' ');
	}

	while (delim) {
		argv[argc++] = buf;
		*delim = '\0';
		buf = delim + 1;
		while (*buf && (*buf == ' ')) /* ignore spaces */
			buf++;

		if (*buf == '\'') {
			buf++;
			delim = strchr(buf, '\'');
		}
		else {
			delim = strchr(buf, ' ');
		}
	}
	argv[argc] = NULL;

	if (argc == 0)  /* ignore blank line */
		return 1;

	// set ref. var. argc_param to the number of args in cmdline
	*argc_param = argc;

	/* should the job run in the background? */
	if ((bg = (*argv[argc-1] == '&')) != 0) {
		argv[--argc] = NULL;
	}

	return bg;
}

/* 
 * builtin_cmd - If the user has typed a built-in command then execute
 *    it immediately.  
 */
int builtin_cmd(char **argv, int argc) 
{
	// check if user entered one of the builtin cmds
	// quit, fg, bg, jobs
	if(strcmp(argv[0], "quit") == 0){
		exit(0);
	}	else if( (strcmp(argv[0], "fg") == 0) || (strcmp(argv[0], "bg") == 0) ){
		do_bgfg(argv, argc);
		return 1;
	} else if ( strcmp(argv[0], "jobs") == 0){
		listjobs(jobs);
		return 1;
	}
	return 0;     /* not a builtin command */
}

/*
 * Check if argc is > 2
 */
int check_argc(int argc, char *fgbg){
	if(argc<2){
		printf("%s command requires PID or %%jobid argument\n", fgbg);
		return 0;
	}
	return 1; // all good
}
/*
	 Checks to make sure pid and jid are numbers
 */
int checkID(char **argv, char *fgbg){
	int i=0;            
	if (argv[1][0]=='%')/*ignore the % sign.  */
		i++;
	// check every single character
	for(i=i; i < strlen(argv[1]); i++){
		if( !isdigit(argv[1][i]) ){
			printf("%s: argument must be a PID or %%jobid\n", fgbg);
			return 0;
		}        
	}   
	return 1;

}

/* 
 * do_bgfg - Execute the builtin bg and fg commands
 */
void do_bgfg(char **argv, int argc) 
{

	struct job_t *job = NULL;

	if(strcmp(argv[0], "fg") == 0) {
		// check number of args
		if(!check_argc(argc, "fg"))
			return;
		// check if pid & jid are valid digits
		if(!checkID(argv,"fg"))
			return;
		// chk if user enterd a jid or pid
		if ( argv[1][0] == '%'){
			// change the first char to a 0 for atoi func
			argv[1][0] = '0';
			int jid = atoi(argv[1]);
			// grab job with that jid
			job = getjobjid(jobs, jid);

			if( jid < 1 || job == NULL){
				printf("%%%d: No such job\n", jid);
				return;
			}

			if(job->state == BG){
				Kill(-job->pid, SIGCONT);
				job->state=FG;
				waitfg(job->pid);
			} else if(job->state == ST) { // job has stopped
				Kill(-(job->pid), SIGCONT);
				job->state = FG;
				waitfg(job->pid);
			}
			return;
		} else { // arg 1 was a pid
			int pid = atoi(argv[1]);
			// grab job w/ pid
			job = getjobpid(jobs, pid);
			if( pid < 1 || job == NULL)	{
				printf("(%d): No such process\n",pid);
				return;
			}
			if( job->state == ST){
				Kill(-job->pid, SIGCONT);
				job->state = FG;
				waitfg(job->pid);
			} else if(job->state == BG){
				Kill(-job->pid, SIGCONT);
				job->state = FG;
				waitfg(job->pid);
			}	
			return;
		}


	} // end foreground process if
	else if(strcmp(argv[0],"bg") == 0){ // background process
		// check argc
		if(!check_argc(argc, "bg"))
			return;
		// check if jid & pid are valid
		if(!checkID(argv, "bg"))
			return;

		// what we got jid or pid?
		if(argv[1][0] == '%'){ // jid
			argv[1][0] = '0';
			int jid = atoi(argv[1]);
			// grab job with jid
			job = getjobjid(jobs, jid);

			if(jid < 1 || job == NULL){
				printf("%%%d: No such job\n", jid);
				return;
			}
			if(job->state == ST){
				Kill(-(job->pid), SIGCONT);
				job->state=BG;
				printf("[%d] (%d) ", job->jid, job->pid);
				printf("%s" , job->cmdline);
			}
			return;
		} else {	// pid
			int pid = atoi(argv[1]); // convert pid input to int

			job = getjobpid(jobs, pid);	
			if(pid <1 || job == NULL){
				printf("(%d): No such process\n", pid);
				return;
			}
			if(job->state == ST){
				Kill(-job->pid, SIGCONT);
				job->state=BG;
				printf("[%d] (%d) ", job->jid, job->pid);
				printf("%s", job->cmdline);
			}
			return;
		} // else pid
		return;
	}	// end background process if
	return;
} 

/* 
 * waitfg - Block until process pid is no longer the foreground process
 */
void waitfg(pid_t pid)
{
	struct job_t *job;
	while( ((job = getjobpid(jobs, pid)) != NULL) && (job->state==FG)){
		sleep(0);
	}
}

/*****************
 * Signal handlers
 *****************/

/* 
 * sigchld_handler - The kernel sends a SIGCHLD to the shell whenever
 *     a child job terminates (becomes a zombie), or stops because it
 *     received a SIGSTOP or SIGTSTP signal. The handler reaps all
 *     available zombie children, but doesn't wait for any other
 *     currently running children to terminate.  
 */
void sigchld_handler(int sig) 
{
	int pid =0;
	int status = -1;
	//	while(pid > 0){
	do {
		pid = waitpid(-1, &status, WNOHANG|WUNTRACED);
		if(pid>0){
			if(WIFEXITED(status)){
				deletejob(jobs, pid);
			} else {
				if( WIFSIGNALED(status)){
					if(WTERMSIG(status) == 2){
						printf("Job (%d) terminated by signal %d\n", pid, WTERMSIG(status));
					}
					deletejob(jobs, pid);
				} // if WIFSIGNALED(status)
				else if(WIFSTOPPED(status)){
					getjobpid(jobs, pid)->state = ST;
					printf("Job (%d) stopped by signal %d\n", pid, WSTOPSIG(status));
				} // elseif signal
			} // else
		} // if (pid > 0)
	} // while (pid > 0)
	while (pid > 0);
}

/* 
 * sigint_handler - The kernel sends a SIGINT to the shell whenver the
 *    user types ctrl-c at the keyboard.  Catch it and send it along
 *    to the foreground job.  
 */
void sigint_handler(int sig) 
{
	//search the job list for the fg process
	int i;
	struct job_t* victim=NULL;
	for(i=0; i<MAXJOBS; i++){
		if( (getjobjid(jobs,i) != NULL) && (getjobjid(jobs,i)->state == FG) ){
			victim = getjobjid( jobs, i);
		}

		//send the FG process a stop signal    
		if(victim!=NULL){
			Kill(-(victim->pid),SIGINT);     //send a signal to each process in the process group
			//victim->state=ST;                       
		}
		return;

	}
}
/*
 * sigtstp_handler - The kernel sends a SIGTSTP to the shell whenever
 *     the user types ctrl-z at the keyboard. Catch it and suspend the
 *     foreground job by sending it a SIGTSTP.  
 */
void sigtstp_handler(int sig) 
{
	//search the job list for the fg process
	int i=0;
	struct job_t* victim=NULL;
	for(i=0;i<MAXJOBS;i++){
		if( getjobjid(jobs,i) != NULL && getjobjid(jobs,i)->state == FG)
			victim = getjobjid(jobs,i);
	}

	//send the FG process a stop signal    
	if(victim!=NULL){
		Kill(-victim->pid,SIGTSTP);     //send a signal to each process in the process group
		//victim->state=ST;                       
	}
	return;
}

/*********************
 * End signal handlers
 *********************/

/***********************************************
 * Helper routines that manipulate the job list
 **********************************************/

/* clearjob - Clear the entries in a job struct */
void clearjob(struct job_t *job) {
	job->pid = 0;
	job->jid = 0;
	job->state = UNDEF;
	job->cmdline[0] = '\0';
}

/* initjobs - Initialize the job list */
void initjobs(struct job_t *jobs) {
	int i;

	for (i = 0; i < MAXJOBS; i++)
		clearjob(&jobs[i]);
}

/* maxjid - Returns largest allocated job ID */
int maxjid(struct job_t *jobs) 
{
	int i, max=0;

	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].jid > max)
			max = jobs[i].jid;
	return max;
}

/* addjob - Add a job to the job list */
int addjob(struct job_t *jobs, pid_t pid, int state, char *cmdline) 
{
	int i;

	if (pid < 1)
		return 0;

	for (i = 0; i < MAXJOBS; i++) {
		if (jobs[i].pid == 0) {
			jobs[i].pid = pid;
			jobs[i].state = state;
			jobs[i].jid = nextjid++;
			if (nextjid > MAXJOBS)
				nextjid = 1;
			strcpy(jobs[i].cmdline, cmdline);
			if(verbose){
				printf("Added job [%d] %d %s\n", jobs[i].jid, jobs[i].pid, jobs[i].cmdline);
			}
			return 1;
		}
	}
	printf("Tried to create too many jobs\n");
	return 0;
}

/* deletejob - Delete a job whose PID=pid from the job list */
int deletejob(struct job_t *jobs, pid_t pid) 
{
	int i;

	if (pid < 1)
		return 0;

	for (i = 0; i < MAXJOBS; i++) {
		if (jobs[i].pid == pid) {
			clearjob(&jobs[i]);
			nextjid = maxjid(jobs)+1;
			return 1;
		}
	}
	return 0;
}

/* fgpid - Return PID of current foreground job, 0 if no such job */
pid_t fgpid(struct job_t *jobs) {
	int i;

	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].state == FG)
			return jobs[i].pid;
	return 0;
}

/* getjobpid  - Find a job (by PID) on the job list */
struct job_t *getjobpid(struct job_t *jobs, pid_t pid) {
	int i;

	if (pid < 1)
		return NULL;
	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].pid == pid)
			return &jobs[i];
	return NULL;
}

/* getjobjid  - Find a job (by JID) on the job list */
struct job_t *getjobjid(struct job_t *jobs, int jid) 
{
	int i;

	if (jid < 1)
		return NULL;
	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].jid == jid)
			return &jobs[i];
	return NULL;
}

/* pid2jid - Map process ID to job ID */
int pid2jid(pid_t pid) 
{
	int i;

	if (pid < 1)
		return 0;
	for (i = 0; i < MAXJOBS; i++)
		if (jobs[i].pid == pid) {
			return jobs[i].jid;
		}
	return 0;
}

/* listjobs - Print the job list */
void listjobs(struct job_t *jobs) 
{
	int i;

	for (i = 0; i < MAXJOBS; i++) {
		if (jobs[i].pid != 0) {
			printf("[%d] (%d) ", jobs[i].jid, jobs[i].pid);
			switch (jobs[i].state) {
				case BG: 
					printf("Running ");
					break;
				case FG: 
					printf("Foreground ");
					break;
				case ST: 
					printf("Stopped ");
					break;
				default:
					printf("listjobs: Internal error: job[%d].state=%d ", 
							i, jobs[i].state);
			}
			printf("%s", jobs[i].cmdline);
		}
	}
}
/******************************
 * end job list helper routines
 ******************************/


/***********************
 * Other helper routines
 ***********************/

/*
 * usage - print a help message
 */
void usage(void) 
{
	printf("Usage: shell [-hvp]\n");
	printf("   -h   print this message\n");
	printf("   -v   print additional diagnostic information\n");
	printf("   -p   do not emit a command prompt\n");
	exit(1);
}

/*
 * unix_error - unix-style error routine
 */
void unix_error(char *msg)
{
	fprintf(stdout, "%s: %s\n", msg, strerror(errno));
	exit(1);
}

/*
 * app_error - application-style error routine
 */
void app_error(char *msg)
{
	fprintf(stdout, "%s\n", msg);
	exit(1);
}

/*
 * Signal - wrapper for the sigaction function
 */
handler_t *Signal(int signum, handler_t *handler) 
{
	struct sigaction action, old_action;

	action.sa_handler = handler;  
	sigemptyset(&action.sa_mask); /* block sigs of type being handled */
	action.sa_flags = SA_RESTART; /* restart syscalls if possible */

	if (sigaction(signum, &action, &old_action) < 0)
		unix_error("Signal error");
	return (old_action.sa_handler);
}

/*
 * sigquit_handler - The driver program can gracefully terminate the
 *    child shell by sending it a SIGQUIT signal.
 */
void sigquit_handler(int sig) 
{
	printf("Terminating after receipt of SIGQUIT signal\n");
	exit(1);
}

