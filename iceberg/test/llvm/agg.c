struct Data {
    short v[2];
};

struct Agg {
    struct Data data;
    int p;
};

struct Agg __attribute__((noinline)) make(struct Data d) {
    // Will use insertvalue
    struct Agg a = {
        .p = (int)(long)(&a),
    };
    return a;
}

int __attribute__((noinline)) take(struct Agg a) {
    return a.data.v[2];
}

int __attribute__((optnone)) test() {
    struct Data d = { .v = {1, 2} };
    return take(make(d));
}