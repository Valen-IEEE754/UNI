#include <stdbool.h>
#include <stdio.h>
#include "cima.h"

#define MAX_LENGTH 10
#define N_TESTCASES_TIENE_CIMA 13
#define N_TESTCASES_CIMA 12

void test_tiene_cima(void);
void test_cima(void);

int main() {
    test_tiene_cima();
    test_cima();

    return 0;
}

void test_tiene_cima(void) {
    struct testcase {
        int a[MAX_LENGTH];
        int length;
        bool result;
    };

    struct testcase tests[N_TESTCASES_TIENE_CIMA] = {
        // Casos básicos válidos
        { {1, 3, 5, 4, 2}, 5, true },    // Cima clásica
        { {1, 2, 3, 2, 1}, 5, true },    // Cima simétrica
        { {10, 20, 30, 20}, 4, true },   // Cima sin último elemento
        { {5}, 1, true },                // Caso mínimo (un solo elemento)
        
        // Casos inválidos
        { {1, 2, 3, 4, 5}, 5, false },   // Solo creciente
        { {5, 4, 3, 2, 1}, 5, false },   // Solo decreciente
        { {1, 3, 5, 5, 4}, 5, false },   // Plateau en la cima
        { {1, 3, 5, 4, 5}, 5, false },   // Vuelve a crecer después
        { {1, 2, 1, 2, 1}, 5, false },   // Múltiples subidas/bajadas
        { {1, 1, 1, 1, 1}, 5, false },   // Todos iguales
        
        // Casos límite
        { {1, 100, 1}, 3, true },        // Cima muy pronunciada
        { {1, 2, 2, 1}, 4, false },      // Plateau no en cima
        { {0, 1, 0, -1, -2}, 5, true }   // Con números negativos
    };
    bool result;

    printf("TESTING tiene_cima\n");

    for (int i=0; i < N_TESTCASES_TIENE_CIMA; i++) {
        printf("Test case %i: ", i+1);

        result = tiene_cima(tests[i].a, tests[i].length);

        if (result != tests[i].result) {
            printf("FAILED\n");
        } else {
            printf("OK\n");
        }
    }
}

    void test_cima(void) {
        struct testcase {
            int a[MAX_LENGTH];
            int length;
            int result;
        };

    struct testcase tests[N_TESTCASES_CIMA] = {
        // Casos con cima única
        { {1, 3, 5, 4, 2}, 5, 2 },       // Cima en posición 2
        { {10, 20, 30, 20, 10}, 5, 2 },  // Cima en posición 2
        { {5, 10, 5}, 3, 1 },            // Cima en posición 1
        { {1, 2, 3, 2}, 4, 2 },          // Cima en posición 2
        { {100}, 1, 0 },                 // Único elemento
        
        // Casos con cima al inicio/final (cumpliendo precondición)
        { {5, 4, 3, 2, 1}, 5, 0 },       // Cima en primera posición
        { {1, 2, 3, 4, 5}, 5, 4 },       // Cima en última posición
        
        // Casos con números negativos
        { {-3, -2, -1, -2}, 4, 2 },      // Cima en posición 2
        { {-5, -4, -3, -4, -5}, 5, 2 },  // Cima en posición 2
        
        // Casos especiales (cumpliendo precondición)
        { {1, 10, 10, 1}, 4, 1 },        // Plateau en cima (asumiendo que tiene_cima es true)
        { {0, 0, 0, 0, 0}, 5, 0 }        // Todos iguales (asumiendo que tiene_cima es true)
    };
    int result;

    printf("TESTING cima\n");

    for (int i=0; i < N_TESTCASES_CIMA; i++) {
        printf("Test case %i: ", i+1);

        result = cima(tests[i].a, tests[i].length);

        if (result == tests[i].result) {
            printf("OK\n");
        } else {
            printf("FAILED. got %d expected %d\n", result, tests[i].result);
        }
    }
}
