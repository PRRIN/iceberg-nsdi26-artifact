#include<stdlib.h>

struct Ptr {
    int *p;
};

int global = 0;

void leak(struct Ptr *p) {
    global = 1;
    p->p = malloc(4);
    free(p->p);
}

void caller() {
    struct Ptr p;
    leak(&p);
    global = 2;
}

