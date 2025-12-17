#include <stdio.h>
#include <stdlib.h>

int func1(int x, int y)
{
	int z = x + y;
	z <<= 4;
	char c = z ^ x;
	return c | (x - y);
}

int func2(int a, int b)
{
	switch (a) {
		case 0: return -1;
		case 1: return a + b;
		case 2: return 3;
		default: return 4;
	}
}

int func3(int a, int b)
{
	switch (a) {
		case 0: return -1;
		case 1: return a + b;
		case 2: return func2(b, a);
		default: return func1(a, b);
	}
}

int func4(int a, int b)
{
	if (func3(a, b)) {
		return func2(a, b);
	} else {
		return func2(func1(0, 1), a + b);
	}
}