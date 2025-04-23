#include <stdio.h>
#include "k_esimo.h"

void print_array(int a[], int length, int lft, int rgt, int ppiv) {
    printf("Array: [");
    for (int i = 0; i < length; i++) {
        if (i == lft && i == rgt) {
            printf("{%d}", a[i]);  // Subarray de un elemento
        } else if (i == lft) {
            printf("{%d", a[i]);   // Inicio del subarray
        } else if (i == rgt) {
            printf(" %d}", a[i]);  // Fin del subarray
        } else {
            printf(" %d", a[i]);
        }
        
        if (i == ppiv) {
            printf("*");  // Marcar el pivote
        }
        
        if (i < length - 1 && !(i == rgt && i+1 < length)) {
            printf(",");
        }
    }
    printf("]\n");
}

void swap(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int partition(int a[], int lft, int rgt) {
    int pivot = a[rgt]; // ¡Aquí se elige el pivote! (el pivote será a[length-1] (último elemento del arreglo completo))
    int i = lft - 1;
    
    for (int j = lft; j <= rgt - 1; j++) {
        if (a[j] < pivot) {
            i++;
            swap(&a[i], &a[j]);
        }
    }
    swap(&a[i + 1], &a[rgt]);
    return i + 1;
}

int k_esimo(int a[], int length, int k) {
    if (k < 0 || k >= length) {
        printf("k está fuera de los límites del arreglo\n");
        return -1;
    }
    
    int lft = 0;
    int rgt = length - 1;
    int ppiv = partition(a, lft, rgt);
    
    printf("\n--- Buscando el %d-ésimo elemento más pequeño ---\n", k);
    printf("Paso inicial:\n");
    print_array(a, length, lft, rgt, ppiv);
    printf("Pivote en posición %d con valor %d\n", ppiv, a[ppiv]);
    
    int step = 1;
    while (ppiv != k) {
        printf("\nPaso %d:\n", step++);
        if (ppiv < k) {
            printf("El pivote (%d) está a la izquierda de k (%d), buscando en la derecha\n", ppiv, k);
            lft = ppiv + 1;
        } else {
            printf("El pivote (%d) está a la derecha de k (%d), buscando en la izquierda\n", ppiv, k);
            rgt = ppiv - 1;
        }
        
        ppiv = partition(a, lft, rgt);
        print_array(a, length, lft, rgt, ppiv);
        printf("Pivote en posición %d con valor %d\n", ppiv, a[ppiv]);
    }
    
    printf("\n--- Resultado final ---\n");
    printf("El %d-ésimo elemento más pequeño es: %d\n", k, a[k]);
    print_array(a, length, -1, -1, -1); // Mostrar todo el array sin subarrays
    
    return a[k];
}