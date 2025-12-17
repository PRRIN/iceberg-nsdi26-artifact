// Tests a bunch of scenarios that Iceberg treats as panics.

int div_by_zero() {
    int array[200];
    for (int i=0; i<200; i++) {
        array[i] = 100-i;
    }
    int result = 0;
    for (int i=0; i<200; i++) {
        result += 200 / array[i];
    }
    return result;
}

int out_of_bound(volatile int array[3]) {
    switch (array[0]) {
        case 0: array[4] = 0; break;
        case 1: array[array[0]-2] = 1; break;
        case 2: array[array[array[0]-2] + 100] = 2; break;
        case 3: return 1;
        default: div_by_zero();
    }
    return 0;
}

int null_pointer(int *p) {
    int a = p ? *p : 0;
    int b = *(p+1);
    return a + b;
}



int nested(int a, int b, int c) {
    int input[3] = {a, b, c};
    input[1] = 3;
    input[0] = null_pointer(input);
    return out_of_bound(input);
}