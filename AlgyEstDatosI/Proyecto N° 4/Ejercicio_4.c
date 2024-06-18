#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

struct my_div_t{
    int cociente;
    int resto;
};

struct my_div_t division(int x, int y){
struct my_div_t r;

    r.cociente =  x / y;
    r.resto    =  x % y;

 return r;
}

int main (void){
    int x,y;
    printf("Ingrese un entero para X:\n");
    scanf("%d",&x);
    printf("Ingrese un entero para Y:\n");
    scanf("%d",&y);
    struct my_div_t r;
    r = division(x,y);
    printf("El valor del cociente es: %d\n",  r.cociente);
    printf("El valor del resto es: %d\n",     r.resto);
    return 0;
}