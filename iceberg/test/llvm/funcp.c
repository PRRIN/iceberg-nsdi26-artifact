#include <stdio.h>

int *null = NULL;
long buf[4];

int panic(int arg) {
    *null = arg;
    return arg;
}

int ret(int x) {
    return x;
}

int rotate(int length) {
    long last = buf[length-1];
    for (int i=1;i<length;i++) {
        buf[i] = buf[i-1];
    }
    buf[0] = last;
    return last;
}

int test_function_pointer(int choice) {
    buf[0] = (long) panic;
    buf[1] = (long) ret;
    buf[2] = (long) rotate;
    buf[3] = (long) test_function_pointer;

    int (*ptr)(int) = (void *)buf[choice % 4];
    return ptr(choice-1);
}