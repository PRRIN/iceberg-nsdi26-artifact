char __attribute__((noinline)) f(int x) {
    return x == 92;
}

int glb;
void __attribute__((noinline)) g(void) { glb = 1; };

void test(int x) {
    if (f(x)) {
        g();
    }
}