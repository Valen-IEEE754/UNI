#include <stdio.h> 
#define N 4
int sumatoria ( int a[],int tam){
    int res = 0, i = 0;
    while (i<tam) {
        res =res + a[i];
        i= i + 1;
    }
    return res;
}
void pedirArreglo(int a[], int n_max) {
    int i,e;
    i = 0;
    e = 0;
    while (i < n_max) {
        printf("Ingrese el elemento %d del arreglo: \n", i);
        scanf("%d", &e);
        a[i]=e;
        i = i + 1;
    }
}

int main () {
    int a[N], res = 0;

    pedirArreglo(a,N);
    res = sumatoria(a,N);

    printf ("El resultado es %i\n", res);
    return 0 ;
}