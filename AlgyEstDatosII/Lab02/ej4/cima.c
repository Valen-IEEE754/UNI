#include <stdio.h>
#include <stdbool.h>
#include "cima.h"

/**
 * @brief Indica si el arreglo tiene cima.
 *
 * Un arreglo tiene cima si existe una posición k tal que el arreglo es
 * estrictamente creciente hasta la posición k y estrictamente decreciente
 * desde la posición k.
 *
 * @param a Arreglo.
 * @param length Largo del arreglo.
 */
bool tiene_cima(int a[], int length) {
    if (length < 1) return false;
    if (length == 1) return true; // Un solo elemento se considera cima
    
    // primero recorremos la parte creciente
    // frenamos cuando termina el arreglo o deja de ser creciente
    int k = 0;
    
    // Parte creciente - debe haber al menos un aumento
    bool has_increase = false;
    while (k < length - 1 && a[k] < a[k+1]) {
        k++;
        has_increase = true;
    }
    // Terminamos. acá vale:
    // - arreglo creciente hasta posición k
    // - termina en posición k (k == length-1)
    //   || el que sigue es mayor o igual (a[k] >= a[k+1])

    // Si no hubo aumento, no es válido (array decreciente o constante)
    if (!has_increase) return false;
    // ahora recorremos la parte decreciente
    // frenamos cuando termina el arreglo o deja de ser decreciente
    // Parte decreciente - debe haber al menos una disminución
    bool has_decrease = false;
    while (k < length - 1 && a[k] > a[k+1]) {
        k++;
        has_decrease = true;
    }
    
    // Si no hubo disminución, no es válido (array creciente o constante después del pico)
    if (!has_decrease) return false;
    
    // Verificar que llegamos al final
    // tiene cima si y sólo si llegamos hasta el final del arreglo
    return k == length - 1;
}

/**
 * @brief Dado un arreglo que tiene cima, devuelve la posición de la cima.
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
int cima(int a[], int length) {
    // recorremos la parte creciente
    // frenamos cuando termina el arreglo o deja de ser creciente
    int k = 0;
    while (k < length - 1 && a[k] < a[k+1]) {
        k++;
    }
    // dos opciones:
    // 1. llegamos al final del arreglo que es todo creciente
    // 2. dejó de ser creciente entre la posición k y k+1
 
 
    // en ambos casos la cima se encuentra en la posición k:
    return k;
 }
 
