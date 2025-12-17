int test_switch(int value) {
    switch (value) {
        case 100: return 1;
        case 101: return 2;
        case 102: return 1;
        case 103: return 4;
        case 104: return 5;
        case 105: return 6;
        case 106: return 7;
        case 107: return 1;
        case 108: return 1;
        case 109: return 10;
        case 110: return 11;
        case 111: return 12;
        case 112: return 13;
        case 113: return 14;
        case 114: return 1;
        case 115: return 1;
        case 116: return 1;
        case 117: return 1;
        case 118: return 19;
        case 119: return 110;
    }
    if (value >= 128 && value <= 255) {
		return value;
	}
	return -1;
}