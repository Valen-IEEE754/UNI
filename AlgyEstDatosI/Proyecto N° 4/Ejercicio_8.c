#include <stdio.h> 
#define N 4
 


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
void intercambiar(int a[], int tam, int i, int j){
    int t = 0;
    int aux = 0;
        aux = a[i];
       a[i] = a[j];
       a[j] = aux;
    while (t < tam) {
        printf("El elemento %d del arreglo es: %d \n", t, a[t]);
        t = t + 1;
    }
}
int main () {
    int a[N], res = 0;
    int x,y;
    pedirArreglo(a,N);

    printf("Ingrese la posicion x:\n");
    scanf("%d", &x);
    printf("Ingrese la posicion y:\n");
    scanf("%d", &y);
    intercambiar(a,N,x,y);
    return 0 ;
}