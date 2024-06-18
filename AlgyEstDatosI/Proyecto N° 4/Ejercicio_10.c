#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
#include <limits.h>
#define N 4

struct comp_t {
    int menores;
    int iguales;
    int mayores;
};

struct comp_t cuantos(int a[], int tam, int elem){
 struct comp_t r;
 int b = 0;
 int c= 0;
 int d= 0;
 int i= 0;
 while (i < tam)
 {
    if (a[i] < elem){d=d+ 1;}
    if (a[i] > elem){b=b+ 1;}
    if (a[i] == elem){c=c+ 1;}
    i = i +1;
    }
    r.menores=d;
    r.mayores=b;
    r.iguales=c;
 return r;
};


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




int main (void)
{
    int a[N], tam, elem;
    struct comp_t r;
    printf("Pasar el tamano del arreglo:\n");
    scanf("%d",&tam);
    pedirArreglo(a,tam);
    printf("Pasar el elemento a acomparar:\n");
    scanf("%d",&elem);
    r = cuantos(a,tam,elem);
    printf("La comparacion es: Minimos: %d Maximos: %d Iguales: %d con respecto a el elem:\n",r.mayores,r.menores,r.iguales);

    return 0;
}