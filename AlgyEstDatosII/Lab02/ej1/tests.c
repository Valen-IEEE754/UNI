#include <stdbool.h>
#include <stdio.h>
#include "k_esimo.h"

#define MAX_LENGTH 5
#define N_TESTCASES 10  // Actualizado a 10 test cases

struct testcase {
    int a[MAX_LENGTH];
    int length;
    int k;
    int result;
};

int main() {
    struct testcase tests[N_TESTCASES] = {
        // Test 1: arreglo de un elemento (k=0 obligatoriamente)
        { {8}, 1, 0, 8 },
        
        // Test 2: arreglo de dos elementos ordenados, con k=0
        { {1, 2}, 2, 0, 1 },
        
        // Test 3: arreglo de dos elementos ordenados, con k=1
        { {1, 2}, 2, 1, 2 },
        
        // Test 4: arreglo de dos elementos desordenados, con k=0
        { {2, 1}, 2, 0, 1 },
        
        // Test 5: arreglo de dos elementos desordenados, con k=1
        { {2, 1}, 2, 1, 2 },
        
        // Test 6: arreglo de ejemplo {8, -2, 9, 0, 13} con k=0
        { {8, -2, 9, 0, 13}, 5, 0, -2 },
        
        // Test 7: arreglo de ejemplo {8, -2, 9, 0, 13} con k=1
        { {8, -2, 9, 0, 13}, 5, 1, 0 },
        
        // Test 8: arreglo de ejemplo {8, -2, 9, 0, 13} con k=2
        { {8, -2, 9, 0, 13}, 5, 2, 8 },
        
        // Test 9: arreglo de ejemplo {8, -2, 9, 0, 13} con k=3
        { {8, -2, 9, 0, 13}, 5, 3, 9 },
        
        // Test 10: arreglo de ejemplo {8, -2, 9, 0, 13} con k=4
        { {8, -2, 9, 0, 13}, 5, 4, 13 }
    };
    int result;
    int passed = 0;

    printf("TESTING k_esimo\n");
    printf("================\n");

    for (int i = 0; i < N_TESTCASES; i++) {
        printf("Test case %i: ", i+1);
        
        // Hacemos una copia del arreglo para no modificarlo permanentemente
        int arr_copy[MAX_LENGTH];
        for (int j = 0; j < tests[i].length; j++) {
            arr_copy[j] = tests[i].a[j];
        }
        
        result = k_esimo(arr_copy, tests[i].length, tests[i].k);
        if (result == tests[i].result) {
            printf("OK\n");
            passed++;
        } else {
            printf("FAILED (Expected %d, got %d)\n", tests[i].result, result);
        }
    }

    printf("\nSummary: %d/%d tests passed\n", passed, N_TESTCASES);
    printf("================\n");

    return (passed == N_TESTCASES) ? 0 : 1;
}