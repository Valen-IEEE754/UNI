#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int pedirEntero(void);
void imprimeEntero(int x);
int main (void){
    imprimeEntero(pedirEntero());
    return 0;
}
int pedirEntero (void){
    int a;
    printf("Introducir numero\n");
    scanf ("%i",&a);
    return a;
}
void imprimeEntero(int x){
    printf("Imprimo numero el numero %i\n",x);
}