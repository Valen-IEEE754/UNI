#include <stdio.h>
#include <stdlib.h>
#include "cima_log.h"
#include "cima_log.h"

void imprimir_arreglo(int a[], int length) {
    printf("[");
    for (int i = 0; i < length; i++) {
        printf("%d", a[i]);
        if (i < length-1) printf(", ");
    }
    printf("]\n");
}

int main() {
    int arr[] = {1, 3, 5, 4, 2};
    int length = sizeof(arr)/sizeof(arr[0]);
    
    printf("Arreglo: ");
    imprimir_arreglo(arr, length);
    
    int k = cima_log(arr, length);
    
    printf("La cima está en la posición: %d\n", k);
    printf("Valor de la cima: %d\n", arr[k]);
    
    return 0;
}