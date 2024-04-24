#include <stdio.h>

int main() {
    int array[6][5] = {
        {8, 3, 14, 19, 8},
        {6, -7, 41, 10, -9},
        {4, 15, 64, -3, 17},
        {33, -5, 88, 12, 36},
        {48, -9, -4, -10, 54},
        {97, -74, 6, 7, -1}
    };

    int positive_count = 0;
    int negative_count = 0;

    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 5; j++) {
            if (array[i][j] > 0)
                positive_count++;
            else if (array[i][j] < 0)
                negative_count++;
        }
    }

    printf("Число положительных элементов: %d\n", positive_count);
    printf("Число отрицательных элементов: %d\n", negative_count);

    return 0;
}