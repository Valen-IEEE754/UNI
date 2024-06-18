#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

void holaHasta(int n){
int i = 0;
while(i<n){
    printf("Hola\n");
    i=i+1;
}
 printf(" Temino de imprimir valores\n");
}

int main (void){
    int t;
    printf("Ingrese la cantidad de Holas:");
    scanf( "%d",&t);
    holaHasta(t);
    return 0;
}