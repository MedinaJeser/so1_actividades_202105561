#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <sys/thread.h>

int main() 
{
    pid_t pid;
    pid = fork();
    
    if (pid == 0) {
        fork();
        thread_create(pid);
    }
    
    fork();

    return 0;
}