#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"
#include "fixstring.h"



static unsigned int partition_fixstring(fixstring a[], unsigned int izq, unsigned int der) {
    unsigned int pivot = izq;
    unsigned int i = izq + 1;
    unsigned int j = der;

    while (i <= j) {
        if (fstring_less_eq(a[i], a[pivot])) {
            i++;
        } else if (fstring_less_eq(a[pivot], a[j])) {
            j--;
        } else {
            fstring_swap(a[i], a[j]);
            i++;
            j--;
        }
    }
    
    fstring_swap(a[pivot], a[j]);
    return j;
}

static void quick_sort_rec_fixstring(fixstring a[], unsigned int izq, unsigned int der) {
    if (der > izq) {
        unsigned int pivot = partition_fixstring(a, izq, der);
        if (pivot > izq) {
            quick_sort_rec_fixstring(a, izq, pivot - 1);
        }
        quick_sort_rec_fixstring(a, pivot + 1, der);
    }
}

void quick_sort_fixstring(fixstring a[], unsigned int length) {
    quick_sort_rec_fixstring(a, 0, (length == 0) ? 0 : length - 1);
}
