#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
bool pedirBooleano(void);
void imprimeBooleano(bool x);
int main (void){
    imprimeBooleano(pedirBooleano());
    return 0;
}
bool pedirBooleano (void){
    bool a;
    printf("Introducir un bool (Si es True = 1, si es False = 0)\n");
    scanf ("%d",&a);
    return a;
}
void imprimeBooleano(bool x){
        printf("Imprimo numero el bool = %d = ",x);
    if(x == 0){
        printf("False\n");
    }else{
        printf("True\n");
    }
}