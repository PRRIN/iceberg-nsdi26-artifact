/**
 * Test summary reuse with different pointers with the same type.
*/

struct thing {
    int data;
};

void callee(struct thing *sth) {
    (sth+1)->data = 1;
}

int caller() {
    struct thing things[3] = {0};
    callee(things);
    callee(&things[1]);
    return things[0].data + things[1].data + things[2].data;
}

/**
 * Test pointer comparison.
*/
int global;

int eq(int *p1, int *p2) {
    *p1 = 0;
    *p2 = 0;
    if (p1 == &global && p2 != p1) {
        *p1 = 1;
        *p2 = 2;
        return 1;
    }
    return 0;
}

int test_results[3];

void test_eq() {
    int a;
    int b;
    test_results[0] = eq(&a, &b);
    test_results[1] = eq(&global, &global);
    test_results[2] = eq(&global, &a);
}

