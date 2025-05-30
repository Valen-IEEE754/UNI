#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"


static unsigned int partition(int a[], unsigned int izq, unsigned int der) {
    unsigned int pivot = izq;
    unsigned int i = izq + 1;
    unsigned int j = der;


    while (i <= j) {
        if (goes_before(a[i], a[pivot])) {
            i++;
        } else if (goes_before(a[pivot], a[j])) {
                j--;
                } else {
                        swap(a, i, j);
                        i++;
                        j--;
                        }
    }  

    swap(a, pivot, j);
    pivot = j;

    return pivot;
}

static void quick_sort_rec(int a[], unsigned int izq, unsigned int der) {
    // Solo proceder si hay al menos 2 elementos en el subarreglo
    if (der > izq) {
        // Particionar el arreglo y obtener la posición del pivote
        unsigned int pivot = partition(a, izq, der);
        
        // Ordenar el subarreglo izquierdo (elementos menores que el pivote)
        // Verificamos que pivot > 0 para evitar underflow en pivot-1
        if (pivot > izq) {
            quick_sort_rec(a, izq, pivot - 1);
        }
        
        // Ordenar el subarreglo derecho (elementos mayores que el pivote)
        quick_sort_rec(a, pivot + 1, der);
    }
}


void quick_sort(int a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}

