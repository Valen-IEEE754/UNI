#include <stdio.h>
#include <stdbool.h>
#include "cima_log.h"

/**
 * @brief Dado un arreglo que tiene cima, devuelve la posición de la cima
 * usando la estrategia divide y venceras.
 *
 * Un arreglo tiene cima si existe una posición k tal que el arreglo es
 * estrictamente creciente hasta la posición k y estrictamente decreciente
 * desde la posición k.
 * La cima es el elemento que se encuentra en la posición k.
 * PRECONDICION: tiene_cima(a, length)
 *
 * @param a Arreglo.
 * @param length Largo del arreglo.
 */

// Función auxiliar para verificar si un punto es cima
static bool es_cima(int a[], int mid, int length) {
    bool es_cima = false;  // Inicialmente asumimos que no es cima
    // Caso 1: Si el arreglo tiene un solo elemento, siempre es cima.
    if (length == 1) {
        es_cima = true;
    }
    // Caso 2: Si es el primer elemento, debe ser mayor que el siguiente.
    else if (mid == 0) {
        es_cima = (a[mid] > a[mid + 1]);
    }
    // Caso 3: Si es el último elemento, debe ser mayor que el anterior.
    else if (mid == length - 1) {
        es_cima = (a[mid] > a[mid - 1]);
    }
    // Caso 4: Si está en el medio, debe ser mayor o igual que ambos vecinos.
    else {
        es_cima = (a[mid] >= a[mid - 1] && a[mid] >= a[mid + 1]);
    }

    return es_cima;  // Único punto de retorno
}

// Función auxiliar para determinar si la cima está a la izquierda
static bool izq_cima(int a[], int mid) {
    return (a[mid] > a[mid+1]);
}

// Función principal recursiva
static int cima_rec(int a[], int lft, int rgt, int length) {
    // Caso base: cuando el rango de búsqueda es inválido
    if (lft > rgt) {
        return -1;  // No se encontró cima en este subarreglo
    }

    int resultado = -1;  // Inicializamos el resultado como no encontrado
    int mid = lft + (rgt - lft) / 2;  // Calculamos el punto medio (evitando overflow)

    // 1. Primero verificamos si el elemento medio es la cima
    if (es_cima(a, mid, length)) {
        resultado = mid;  // Encontramos la cima
    }
    // 2. Si no es cima, pero la cima está a la izquierda (según la pendiente)
    else if (izq_cima(a, mid)) {
        resultado = cima_rec(a, lft, mid-1, length);  // Buscar en subarreglo izquierdo
    }
    // 3. Si la cima está a la derecha
    else {
        resultado = cima_rec(a, mid+1, rgt, length);  // Buscar en subarreglo derecho
    }
    
    return resultado;  // Devolver el resultado de la búsqueda
}

// Función pública
int cima_log(int a[], int length) {
    int resultado = -1;
    if (length != 0) {
        resultado = cima_rec(a, 0, length-1, length);
    }
    return resultado;
}