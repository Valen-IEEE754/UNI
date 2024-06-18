#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
#include <limits.h>
#define N 4

struct data {
    float maximo;
    float minimo;
    float promedio;
};

void pedirArreglo(float a[], int tam){
int i = 0, e = 0;
while(i<tam) {
 printf(" Ingrese el valor para el lugar: %d\n",i);
    scanf("%d", &e);
    a[i]=e;
    i=i+1;
}
}
struct data structura(float a[], int tam){
    int i=0;
    float max, min,promedio,sum=0;
    struct data r;
    max=INT_MIN;
    min=INT_MAX;
    while (i<tam){
        if(max<=a[i]){ max=a[i];}
        if (min>=a[i]){min=a[i];}
        sum=sum+a[i];
        i++;
    }
    promedio=sum/tam;
    r.maximo=max;
    r.minimo=min;
    r.promedio=promedio;
    return r;
}
int main (void){
    int tam;
    float a[N];
    struct data r;
    printf("Pasar el tamano del arreglo:\n");
    scanf("%d",&tam);
    pedirArreglo (a,tam);
    r=structura(a,tam);
    printf("Minimos: %f Maximos: %f Promedio: %f con respecto a el elem:\n",r.minimo,r.maximo,r.promedio);


    return 0;
}