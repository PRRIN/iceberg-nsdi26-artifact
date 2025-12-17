struct MyStruct {
    int a;
    int b;
};

enum Color {
    Red,
    Green,
    Blue,
};

int satMul3(int x) {
    int Tmax = ~(1 << 31);
    int mul = (x << 1) + x;
    int s1 = (x >> 31) & 1;
    int s2 = (x >> 30) & 1;
    int s3 = (mul >> 31) & 1;
    int frag = (s1 ^ s3) | (s1 ^ s2);
    int b = (frag << 31) >> 31;
    int resultSatMul3 = ((~b) & mul) + (b & (Tmax + s1));
    return resultSatMul3;
}

int test(int n, int bias, int bits, enum Color color) {
    struct MyStruct m;
    m.a = n;
    m.b = n;
    char c = (char)n;
    int result = 1;
    switch (color)
    {
    case Red:
        m.a += bias;
        result *= m.a;
        break;
    case Green:
        m.b -= bias;
        result += (int)c;
        break;
    case Blue:
        result = (int)color;
        result += bias;
        break;
    default:
        break;
    }
    result &= bits;
    
    if (result > 0)
        result -= m.b;
    else
        result *= result;

    return result;
}