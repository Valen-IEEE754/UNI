#include <stdio.h>
#include <stdbool.h>

void pedirArreglo(int a[], int n_max) {
    int i;
    i = 0;
    while (i < n_max) {
        printf("Ingrese el elemento %d del arreglo: \n", i);
        scanf("%d", &a[i]);
        i = i + 1;
    }
}

bool existe_positivo (int a[], int tam) {
    bool b;
    int i;
    i = 0;
    b = 0;

    while (i < tam && !b) {
        b = (a[i] > 0);
        i = i + 1;
    }
    return b;
}

bool todos_positivos(int a[], int tam) {
    int i, b;
    i = 0;
    b = 1;

    while (i < tam && b) {
        b = (a[i] > 0);
        i = i + 1;
    }
    return b;
}

#define tam 3
int main(void) {
    int array[tam];
    int x, opcion;
    pedirArreglo(array, tam);

    printf("Escriba 1 para verificar si existen valores positivos. Escriba 0 para verificar que todos los valores son positivos \n");
    scanf("%d", &opcion);

    if (opcion == 1) {
        x = existe_positivo(array, tam);
        printf("1 es True y 0 es False, la respuesta es %d \n", x);
    }
    else {
        todos_positivos(array, tam);
        x = todos_positivos(array, tam);
        printf("1 es True y 0 es False, la respuesta es %d \n", x);
    }
    return 0;
}