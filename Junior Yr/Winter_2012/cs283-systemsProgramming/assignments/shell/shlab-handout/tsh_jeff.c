/* 
 * tsh - A tiny shell program with job control
 * 
 * 
 */
#define _POSIX_SOURCE
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <ctype.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <errno.h>
#include "wrappers.h"
#include "helper.h"
#include "proc_creation.h"

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
int debu=0;
int verbose = 0;            /* if true, print additional output */
int nextjid = 1;     /* next job ID to allocate */
char sbuf[MAXLINE];         /* for composing sprintf messages */
sigset_t maskchld;          /* the only SIG I ever want to mask is SIGCHLD, global scope is useful*/


struct job_t jobs[MAXJOBS]; /* The job list */
/* End global variables */


/* Function prototypes */

/* Here are the functions that you will implement */
void eval(char *cmdline);
int builtin_cmd(char **argv,int numberofargs);
void do_bgfg(char **argv, int numberofargs);
void waitfg(pid_t pid);

void sigchld_handler(int sig);
void sigtstp_handler(int sig);
void sigint_handler(int sig);

/* Here are helper routines that we've provided for you */
int parseline(const char *cmdline, char **argv, int *argcc); 
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

/*
 * main - The shell's main routine 
 */
int main(int argc, char **argv) 
{
    char c='x';

    char cmdline[MAXLINE];
    int emit_prompt = 1; /* emit prompt (default) */
    Sigemptyset(&maskchld);
    Sigaddset(&maskchld, SIGCHLD);
    Sigaddset(&maskchld, SIGTSTP);
    

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
    /*So that we are not interrupted while updating the jobs list.  
    /the argument vector that will contain the cmd line tokens*/
    char *argv[MAXARGS];

    /*argc is the number of arguments.  I modified parseline to save argc*/
    int argc=0;    
    int isBG=parseline(cmdline,argv,&argc);
    

    /*We evaluate built-in commands, and then try to run everythin else.*/
    
    if(builtin_cmd(argv,argc))
        return;   
    Sigprocmask(SIG_BLOCK,&maskchld,NULL);    
    if(isBG)    /*BG process start*/
    {
        bg_create(argv);
        

    } else {    /*FG process start       */
        fg_create(argv);
        /*remeber, this is wait until child finishes*/
    }
    return;
}

/* 
 * parseline - Parse the command line and build the argv array.
 * 
 * Characters enclosed in single quotes are treated as a single
 * argument.  Return true if the user has requested a BG job, false if
 * the user has requested a FG job.  
 */
int parseline(const char *cmdline, char **argv, int *argcc) 
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
    /*The number of arguments is useful outside this function, 
    I'm taking it, I'm no sucker. */ 
    *argcc=argc;

    /* should the job run in the background? */
    if ((bg = (*argv[argc-1] == '&')) != 0) {
	argv[--argc] = NULL;
    }
    return bg;
}

/* 
 * builtin_cmd - If the user has typed a built-in command then execute
 *    it immediately.   quit, fg, bg, and jobs
 */
int builtin_cmd(char **argv, int numberofargs)   
{

    /*Here is the order of command processing:
    * 1) check if exit or quit is entered
    * 2) check for fg/bg command
    * 3) check for jobs command
    * return 0 if none of these, the command is either a program or invalid
    */
    if(strcmp(argv[0],"quit")==0||strcmp(argv[0],"exit")==0)    
        exit(EXIT_SUCCESS);
    else if( strcmp(argv[0],"fg")==0 || strcmp(argv[0],"bg")==0 )    
        {        
        do_bgfg(argv,numberofargs);
        return 1;
        }
    else if(strcmp(argv[0],"jobs")==0)  /*jobs */   
    { 
        listjobs(jobs);
        return 1;
    }
    return 0;     /* not a builtin command */
}

/* 
 * do_bgfg - Execute the builtin bg and fg commands
 */


/* we are looking for 2 arguments, the fg command and a pid/jid*/
int checkForArg1(char **argv, int numberofargs){    
    if(numberofargs<2){
            printf("fg command requires PID or %%jobid argument\n");
            return 0;
            }
    return 1;
}

/* this function checks if the pid/jid is valid*/
int checkIfDigits(char **argv){
     int i=0;        
        if (argv[1][0]=='%')/*ignore the % sign.  */
            i++;
        for(i=i;i<strlen(argv[1]);i++){
            if(!isdigit(argv[1][i])){   /*one-by-one, check if each character is a digit.  */
                printf("fg: argument must be a PID or %%jobid\n");
                return 0;
                }                
        }
    return 1;
}

/* we are looking for 2 arguments, the bg command and a pid/jid*/
int checkForArgbg(char **argv, int numberofargs){
   if(numberofargs<2){
            printf("bg command requires PID or %%jobid argument\n");
            return 0;
            }
    return 1;
}

/* this function checks if the pid/jid is valid*/
/* it is functionally similar to the other checkIfDigits, except it prints a different message on error*/
int checkIfDigitsbg(char **argv){
     int i=0;
        if(debu)printf("checking digits\n");
        if (argv[1][0]=='%')
            i++;
        for(i=i;i<strlen(argv[1]);i++){
            if(!isdigit(argv[1][i])){
                printf("bg: argument must be a PID or %%jobid\n");
                return 0;
                }                
        }
    return 1;
}

/*This function uses SIGCONT to either put a stopped process
*  in the background or foreground.  Code bloat is occuring
*  because the user can type bg/fg, followed by a pid/jid, on
* a process that may be stopped or in the background. 
*/
void do_bgfg(char **argv, int numberofargs)   
{
    int jid;
    int pid;
    struct job_t* job=NULL;   
    
    if(strcmp(argv[0],"fg")==0)
    {/*### Begin Foreground command processing ###    */
        /*BG or ST to FG*/
        
        /*check if input is valid*/
        if(!checkForArg1(argv,numberofargs))
            return;
        if(!checkIfDigits(argv))
            return;
               
        /*check if a jid was input*/
        if (argv[1][0]=='%')
        {
            argv[1][0]='0';             /*remove the % sign for parsing*/
            jid=(int)atoi(argv[1]);      /*change the jid string to an integer*/

            job=getjobjid(jobs,jid);    /*search jobs by jid*/
            if(jid<1||job==NULL){       /*check if job exists*/
                printf("%%%d: No such job\n",jid);
                return;
            }
            if(job->state==ST){           /*if process is STopped*/
                Kill(-(job->pid), SIGCONT);
                job->state=FG;
                waitfg(job->pid);
            }else if(job->state==BG){     /*if process is in BackgrounG*/
                Kill(-job->pid, SIGCONT);    
                job->state=FG;
                waitfg(job->pid);            
            }
            return;
        }else {
            /*the user entered a pid*/
            pid=atoi(argv[1]);           /*change the pid string to integer*/

            job=getjobpid(jobs,pid);        /*search the jobs by pid    */
            if(pid<1||job==NULL){                   /*check if job exists*/
                printf("(%d): No such process\n",pid);
                return;
            }
            if(job->state==ST){           /*if process is STopped*/
                Kill(-job->pid, SIGCONT);
                job->state=FG;
                waitfg(job->pid);
            }else if(job->state==BG){     /*if process is in BackgrounG*/
                Kill(-job->pid, SIGCONT);    
                job->state=FG;
                waitfg(job->pid);
            }
            return;
        }
    /*###  End of foreground command processing  ####
     *-------------------------------------------------
     /###  Begin background command processing ### 
     */
    } else if(strcmp(argv[0],"bg")==0){     /*ST to BG*/

        /*make sure input is valid*/
        if(!checkForArgbg(argv,numberofargs))
            return;
        if(!checkIfDigitsbg(argv))
            return;
               
        /*check if user entered a jid*/
        if (argv[1][0]=='%')
        {
            int jid=atoi(argv[1]);      /*parse the jid to an integer*/
            argv[1][0]='0';             /*remove the % sign for parsing*/

            job=getjobjid(jobs,jid);    /*search jobs by jid*/
            if(jid<1||job==NULL){       /*check if jobs is valid*/
                printf("%%%d: No such job\n",jid);
                return;
            }
            if(job->state==ST){           /*Move process to Background from stop*/
                Kill(-job->pid, SIGCONT);
                job->state=BG;
                printf("[%d] (%d) ", job->jid, job->pid);
        	    printf("%s", job->cmdline);               
            }
            return;
        }else {
            int pid=atoi(argv[1]);       /*parse the pid to an integer*/

            job=getjobpid(jobs,pid);     /*search jobs by jid*/
            if(pid<1||job==NULL){        /*check if jobs is valid*/
                printf("(%d): No such process\n",pid);
                return;
            }            
            if(job->state==ST){           /*Move process to Background from stop*/
                Kill(-job->pid, SIGCONT);
                job->state=BG;
                printf("[%d] (%d) ", job->jid, job->pid);
        	    printf("%s", job->cmdline);               
            }
            return;
        }
        return;
    }/*###  End of background command processing  ####*/
    
    return;
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
    
    int pid=0;
    int status=-1;
    do{     /*continually reap as many children as possible, deleting them from the job list*/
        pid=waitpid(-1,&status,WNOHANG|WUNTRACED);   
        
        if(pid>0)
        {
            if(WIFEXITED(status)){/*child terminated normally, easy to handle, just delete it from the job list*/
                deletejob(jobs,pid);
                /*printf("delete job%d\n",pid);*/
            }
            else
            if(WIFSIGNALED(status)){  /*what if the process was terminated by another process?*/
                if(WTERMSIG(status)==2)
                    printf("Job [%d] (%d) terminated by signal %d\n", pid2jid(pid), pid, WTERMSIG(status));
                deletejob(jobs,pid);
            }
            else if(WIFSTOPPED(status)){    /*what if the process was stopped by another process?*/
                getjobpid(jobs, pid)->state=ST;
                printf("Job [%d] (%d) stopped by signal %d\n", pid2jid(pid), pid, WSTOPSIG(status));
            }
        }        
    }
    while(pid>0);
    
}

/* 
 * sigint_handler - The kernel sends a SIGINT to the shell whenver the
 *    user types ctrl-c at the keyboard.  Catch it and send it along
 *    to the foreground job.  
 */
void sigint_handler(int sig)  
{       
    /*search the job list for the fg process   */
    int i=0;
    struct job_t* victim=NULL;
    for(i=0;i<MAXJOBS;i++){        
        if(getjobjid(jobs,i)!=NULL&&getjobjid(jobs,i)->state==FG)
            victim=getjobjid(jobs,i);     
    }
    /*send the FG process a killer signal*/
    
    if(victim!=NULL){   
        Kill(-(victim->pid),SIGINT);     
        /*printf("Job [%d] (%d) terminated by signal %d\n",victim->jid,victim->pid,sig);*/
        /*deletejob(jobs,victim->pid);    */
    }

    return;
}

/*
 * sigtstp_handler - The kernel sends a SIGTSTP to the shell whenever
 *     the user types ctrl-z at the keyboard. Catch it and suspend the
 *     foreground job by sending it a SIGTSTP.  
 */
void sigtstp_handler(int sig)  
{    
     /*search the job list for the fg process*/
    int i=0;
    struct job_t* victim=NULL;
    for(i=0;i<MAXJOBS;i++){        
        if(getjobjid(jobs,i)!=NULL&&getjobjid(jobs,i)->state==FG)
            victim=getjobjid(jobs,i);
    }

    /*send the FG process a stop signal    */
    if(victim!=NULL){ 
        Kill(-victim->pid,SIGTSTP);     /*send a signal to each process in the process group*/
        /*victim->state=ST;*/
    }   
    return;
}
/*********************
 * End signal handlers
 *********************/

