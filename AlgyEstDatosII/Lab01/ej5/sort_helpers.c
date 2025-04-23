#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "fixstring.h"

void swap(fixstring a[], unsigned int i, unsigned int j) {
    /*
    Intercambia los elementos en las posiciones i y j del array a[]
    usando una variable temporal para el intercambio
    */
    /*
    Solucion si fuera un puntero, si fuera fixstring es char*
    void swap(fixstring a[], unsigned int i, unsigned int j) {
    // Intercambia los punteros (no copia el contenido)
    fixstring temp = a[i];
    a[i] = a[j];
    a[j] = temp;
    }
    Pero da error por lo esta intentando asignar de forma directa
    Problema: fixstring está definido como un array de caracteres de tamaño fijo (ej: typedef char fixstring[50]),
    y no puedes asignar arrays directamente en C.Como:
    (ej: char[50])
        o
    (const fixstring a[];  // ¡Los elementos no se pueden modificar!)

    Solución clave: 
    Usar strcpy() para copiar el contenido de los strings en lugar de asignación directa.
    */
    fixstring temp;
   strcpy(temp, a[i]);    // Copia a[i] a temp
   strcpy(a[i], a[j]);    // Copia a[j] a a[i]
   strcpy(a[j], temp);    // Copia temp a a[j]
}

bool goes_before(fixstring x, fixstring y) {
    /*
    Compara lexicográficamente los strings x e y
    Retorna true si x debe ir antes que y en orden alfabético

    Proceso:
        1. Compara los strings con strcmp()
        2. strcmp retorna:
            - <0 si x < y (en orden alfabético)
            - 0  si x == y
            - >0 si x > y
        3. Convertimos el resultado a booleano
     */
    int r = strcmp(x, y);
    return (r < 0);
}

bool array_is_sorted(fixstring array[], unsigned int length) {
    unsigned int i = 1;
    while (i < length && goes_before(array[i-1], array[i])) {
        i++;
    }
    return (i >= length);
}

