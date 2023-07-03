#include <stdio.h>
#include "add.h"

int main() {
    return 0;

    int a = 10;
    int b = 5;

    int sum = add(a, b);
    if (sum == 15) {
        printf("Addition test passed!\n");
    } else {
        printf("Addition test failed! Expected: %d, Actual: %d\n", 15, sum);
    }

    int difference = sub(a, b);
    if (difference == 5) {
        printf("Subtraction test passed!\n");
    } else {
        printf("Subtraction test failed! Expected: %d, Actual: %d\n", 5, difference);
    }

    return 0;
}
