#include <stdlib.h>

struct S {
    int s;
    char t;
};

/**
 * Tests basic malloc().
*/
void test_basic() {
    void *p = malloc(sizeof(int));
}

/**
 * Tests leaking malloc-ed pointers.
*/
uint64_t test_return(void **p) {
    uint64_t ptr = (uint64_t) malloc(sizeof(int));
    *p = malloc(sizeof(struct S));
    return ptr;
}

/**
 * Tests using malloc() locally.
*/
int test_local(int s, int t) {
    struct S *ps = malloc(sizeof(struct S));
    ps->s = s;
    ps->t = t;
    return ps->s + ps->t;
}

/**
 * Tests using malloc() to construct structs.
*/
struct S* new() {
    struct S *ps = malloc(sizeof(struct S));
    ps->s = 0;
    ps->t = 0;
    return ps;
}

struct S* test_construct(int t) {
    struct S *ps1 = new();
    struct S *ps2 = new();
    if (t > 0) {
        ps1->t = t;
        return ps1;
    } else {
        return ps2;
    }
}

void foo(void *p) {
    free(p);
}

/**
 * Tests free().
*/
void test_free(int cond) {
    int *p = malloc(sizeof(int));
    if (cond == 1) {
        foo(p);
    }
    *p = 1;
    if (cond == 2) {
        foo(p);
    }
    free(p);
}