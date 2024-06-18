#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

void pedirArreglo(int a[], int tam){
int i = 0, e = 0;
while(i<tam) {
 printf(" Ingrese el valor para el lugar: %d\n",i);
    scanf("%d", &e);
    a[i]=e;
    i=i+1;
}
}


void imprimeArreglo(int a[], int tam){
int i = 0;
int e = 0;
while(i<tam){
    printf(" El valor es: %d\n",a[i]);
    i=i+1;
}
 printf(" Teminaron de imprimir valores\n");
}


int main (void){
    int t;
    printf("Ingrese el tamano:");
    scanf( "%d",&t);
    int a[t];
    pedirArreglo(a,t);
    imprimeArreglo(a,t);
    return 0;
}