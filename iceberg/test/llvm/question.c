/**
 * Testing the proper execution timing of summary stores/retvals
*/
int global = 0;

int f2(int x) {
    global += x;
    return global;
}

void f1(int x) {
    x = f2(x);
    x = f2(2*x);
}

/**
 * Testing the happy path of summary reuse using symbolic regions
*/

void callee(int *p) {
    *p = *p + 1;
}

void intermediate(int *p) {
    int local = 0;
    callee(&local);
    callee(p);
    *p += local;
}

int c;

long caller() {
    int a = 0;
    int b = 0;
    c = 0;

    callee(&a);
    intermediate(&a);
    intermediate(&a);

    intermediate(&b);
    callee(&b);
    intermediate(&b);

    intermediate(&c);
    intermediate(&c);
    callee(&c);
    
    return a * 10000 + b * 100 + c;
}

/**
 * Testing the unhappy path of summary reuse where there are aliasing issues.
*/
void may_alias(int *a, int *b) {
    *a += *b;
    *a += *b;
}

int alias() {
    int local = 1;
    may_alias(&local, &local);
    return local;
}

int noalias() {
    int a = 1;
    int b = 1;
    may_alias(&a, &b);
    return a;
}