#include <stdio.h>

int llvm_memcpy1(int x) {
    // Initialization will use llvm.memcpy
    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    return arr[x];
}

int llvm_memset1(int x, int y) {
    // Initialization will use llvm.memset
    int arr[100] = {0};
    arr[x] = 1;
    return arr[y];
}

struct S {
    struct {
        int a;
        char b;
    } s;
    char c;
    int d[2];
    struct S *e;
} glb;

int llvm_memcpy2(int x) {
    struct S s = {
        .s = { 1, 2 },
        .c = 3,
        .d = { 4, 5 },
        .e = &glb,
    };
    return s.d[x] + s.e->c;
}

long llvm_memset2(int x, int y) {
    struct S s = {
        .s = { 0, 0 },
        .c = 0,
        .d = { 0, 0 },
        .e = NULL,
    };
    s.d[x] = 1;
    return ((long) s.e) + s.d[y];
}
