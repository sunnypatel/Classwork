#include "csapp.h"

#define	BUFFSIZE	128
#define	PERMS		0666
#define KEY ((key_t) 7777)

int main()
{
	int	i, msqid;
	struct {
		long	m_type;
		char  m_text[BUFFSIZE];
	} msgbuffs, msgbuffr;
	if ( (msqid = msgget(KEY, PERMS | IPC_CREAT)) < 0)
		perror("msgget error");
	msgbuffs.m_type = 1L;
	strcpy(msgbuffs.m_text,"a REALLY boring message");
	if (msgsnd(msqid, &msgbuffs, BUFFSIZE, 0) < 0)
		perror("msgsnd error");

	printf("the message sent is: %s \n", msgbuffs.m_text); 

	if (msgrcv(msqid, &msgbuffr, BUFFSIZE, 0L, 0) != BUFFSIZE)
		perror("msgrcv error");

	printf("the message received is: %s \n", msgbuffr.m_text);

	// remove msg
	if (msgctl(msqid, IPC_RMID, (struct msqid_ds *) 0) < 0)
		perror("IPC_RMID error");

	exit(0);
}
