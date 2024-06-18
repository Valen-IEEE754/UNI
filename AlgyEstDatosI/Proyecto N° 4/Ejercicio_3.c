#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

int suma_hasta(int N){
    int res;
    res = (N * (N+1))/2 ;
 return res;
}
int main (void){
    int N, res;
    printf("Ingrese hasta cuanto es el numero que quiere sumar:\n");
    scanf("%d",&N);
    if (N<0){
    printf("Error el numero ingresado no es positivo.\n");
    }
    else 
    {
    res = suma_hasta(N);
    printf("El valor es: %d\n",res);
    }
    return 0;
}