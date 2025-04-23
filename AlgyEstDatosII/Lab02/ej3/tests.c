#include <stdbool.h>
#include <stdio.h>
#include "cima_log.h"

#define MAX_LENGTH 10
#define N_TESTCASES_CIMA 12

int main() {
    struct testcase {
        int a[MAX_LENGTH];
        int length;
        int result;
    };

    struct testcase tests[N_TESTCASES_CIMA] = {
        {{1, 3, 5, 4, 2}, 5, 2},       // Cima clásica
        {{1, 2, 3, 2, 1}, 5, 2},       // Cima simétrica
        {{10, 20, 30, 20}, 4, 2},      // Cima sin último elemento
        {{5}, 1, 0},                   // Único elemento
        {{1, 2, 3, 4, 5}, 5, 4},       // Cima al final
        {{5, 4, 3, 2, 1}, 5, 0},       // Cima al inicio
        {{-3, -2, -1, -2}, 4, 2},      // Con negativos
        {{1, 10, 9, 8, 7}, 5, 1},      // Cima temprana
        {{1, 2, 3, 4, 3, 2, 1}, 7, 3}, // Cima central
        {{1, 2, 1, 0, -1}, 5, 1},       // Múltiples picos (devuelve el primero encontrado)
        {{0, 0, 0, 0, 0}, 5, 2},       // Todos iguales (devuelve el medio)
        {{0}, 0, -1}                    // Arreglo vacío
    };
    int result;

    printf("TESTING cima\n");

    for (int i=0; i < N_TESTCASES_CIMA; i++) {
        printf("Test case %i: ", i+1);

        result = cima_log(tests[i].a, tests[i].length);

        if (result == tests[i].result) {
            printf("OK\n");
        } else {
            printf("FAILED. got %d expected %d\n", result, tests[i].result);
        }
    }

    return 0;
}
