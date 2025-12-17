#include<iostream>
#include<stdio.h>

class Foo {
public:
    int f;
    Foo() { f = 0; }
    Foo(int _f) { f = _f; }
    Foo(Foo &x) { f= x.f; }
    ~Foo() {}
};

int throw_int(int x) {
    if (x > 20)
        throw x;
    return x;
}

int bar(int x) {
    if (x > 10)
        return throw_int(x);
    try {
        Foo f(x);
        // std::cout << "try block, f=" << f.f << std::endl;
        throw f;
    }
    // catch (int i) {
    //     i += 1;
    //     if (i < 0)
    //         throw 100;
    // }
    catch (Foo& f) {
        // f.f += 1;
        // if (f.f < 0)
            // std::cout << "inner catch block, f="<< f.f << std::endl;
        char c = 'c';
        if (f.f == 5)
            throw c;
        if (f.f < 5) {
            f.f -= 5;
            throw f;
        }
        throw;
    }
    return 0;
}

int test(int x) {
    int ret;
    try {
        ret = 2 * bar(x); // 10 < x <= 20
    }
    catch (int t) {
        ret = t * 4; // x > 20
    }
    catch (Foo &f) {
        ret = f.f;
    }
    catch (...) {
        ret = 0;
    }
    return ret;
}

int main() {
    try {
        try {
            int i = 15213;
            char c = 'c';
            throw bar(-2);
        }
        catch (Foo& f2) {
            throw;
        }
    }
    catch (int d) {
        // std::cout << "outer block double d=" << d << std::endl;
    }
    catch (Foo& f) {
        // std::cout << "outer catch block" << f.f << std::endl;
        try {
            throw f;
        }
        catch (Foo& f2) {

        }
    }
    // std::cout << "outer try end" << std::endl;
}