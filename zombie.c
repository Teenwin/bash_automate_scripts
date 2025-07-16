#simple zombie process
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
    // Создаём дочерний процесс
    pid_t pid = fork();

    if (pid > 0) {
        // Родительский процесс
        // Он не вызывает wait(), чтобы дочерний остался зомби
        sleep(60);  // Родитель "спит", чтобы дать время посмотреть на зомби
    } else if (pid == 0) {
        // Дочерний процесс
        exit(0);  // Завершаем дочерний процесс
    } else {
        // Ошибка
        exit(1);
    }

    return 0;
}
