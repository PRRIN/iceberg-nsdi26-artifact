int * leak() {
    int local;
    return &local;
}

// TODO: not supported now
int undefined(int x) {
    if (x > *leak()) {
        return 1;
    } else {
        return 0;
    }
}