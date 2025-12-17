int loop0(char num) {
    int cnt = 0;
    while (num > 0) {
        num >>= 1;
        cnt += 1;
    }
    return cnt;
}

int loop1(char l, char r) {
    char mid;
    while (r-l >= 2) {
        mid = (l + r) >> 1;
        if (mid < 0) {
            l = mid;
        } else {
            r = mid;
        }
    }
    return mid;
}

volatile int arr[2];
int loop2() {
    arr[0] = 0;
    arr[1] = 1;
    for (int i=0;i<65536;i++) {
        arr[i & 1] += arr[(i+1) & 1];
    }
    return arr[0];
}