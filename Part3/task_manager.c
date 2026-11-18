#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    pid_t pid1, pid2;

    printf("Parent Task Manager Process (PID: %d)\n", getpid());

    pid1 = fork();
    if (pid1 == 0) {
        printf("\n--- Worker 1: CPU Monitor (PID: %d) ---\n", getpid());
        char *args[] = {"/usr/bin/mpstat", "1", "1", NULL};
        execv(args[0], args);
        perror("execv mpstat failed");
        exit(1);
    }
    pid2 = fork();
    if (pid2 == 0) {
        sleep(1);
        printf("\n--- Worker 2: Process Monitor (PID: %d) ---\n", getpid());
        char *args[] = {"/bin/ps", "-ef", NULL};
        execv(args[0], args);
        perror("execv ps failed");
        exit(1);
    }
    waitpid(pid1, NULL, 0);
    waitpid(pid2, NULL, 0);

    printf("\n[+] All worker processes completed successfully.\n");
    return 0;
}
