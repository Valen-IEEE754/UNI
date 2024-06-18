#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
#include <limits.h>
#define N 4
#define min(X, Y) (((X) < (Y)) ? (X) : (Y))

void pedirArreglo(int a[], int n_max) {
    int i = 0;
    int e = 0;
    while (i < n_max) {
        printf("Ingrese el elemento %d del arreglo: \n", i);
        scanf("%d", &e);
        a[i]=e;
        i = i + 1;
    }
}

int minimo_pares(int a[], int tam)
{
    int i=0;
    int n=INT_MAX;
    while (i<tam){
        if ((a[i]%2)==0){
            n= min (n,a[i]);
        }
        i = i + 1;
    }
    return n;
}
int minimo_impares(int a[], int tam)
{
    int i=0;
    int n=INT_MAX;
    while (i<tam){
        if (a[i]%2==1){
            n= min (n,a[i]);
            }
        i = i + 1;
    }
    return n;
}

int main (void)
{
    int a[N], tam;
    printf("Pasar el tamano del arreglo:\n");
    scanf("%d",&tam);
    pedirArreglo(a,tam);
    int min_impar = minimo_impares(a,tam);
    int min_par = minimo_pares(a,tam);

    int minimo;
    if(min_par<=min_impar){minimo = min_par;}else {minimo = min_impar;}

    printf("El minimo elemento es: %d\n",minimo);

    return 0;
}