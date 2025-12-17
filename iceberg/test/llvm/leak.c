#include <stdlib.h>

void *leak1() {
    char buf[100] = "I am local.";
    // leaks local allocation
    return buf;
}

void *gbuf;

void leak2() {
    char buf[100] = "I am local.";
    // leaks local allocation
    gbuf = buf;
}

void leak3() {
    char buf[100] = "I am local.";
    // leaks local allocation
    long *heap1 = malloc(sizeof(long));
    long *heap2 = malloc(sizeof(long));
    *heap1 = (long)(void *)buf;
    *heap2 = (long)(void *)heap1;
    gbuf = heap2;
}
