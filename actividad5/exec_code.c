#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <pthread.h>

void *thread_function(void *arg) {
    // Implementa la lógica de la función del hilo aquí
    printf("Thread created in process %d\n", getpid());
    pthread_exit(NULL);
}

int main()
{
    pid_t pid;
    pid = fork();

    if (pid == 0)
    {
        fork();

        // thread_create(pid);
        pthread_t thread_id;
        int thread_create_status;

        thread_create_status = pthread_create(&thread_id, NULL, thread_function, NULL);
        if (thread_create_status != 0)
        {
            fprintf(stderr, "Error al crear el hilo: %d\n", thread_create_status);
            exit(EXIT_FAILURE);
        }

        pthread_join(thread_id, NULL);
    }

    fork();

    return 0;
}