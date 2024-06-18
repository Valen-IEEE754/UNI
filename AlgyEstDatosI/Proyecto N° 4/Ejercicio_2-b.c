#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

void minimo (int x, int y, int z){
    int h,k,g;
    g = y;
    h =  y + x + z;
    k = y + x;
    printf("Los valores de x,y,z son: %d,%d,%d\n",g,h,k);
}
int main (void){
    int x,y,z;
    int min;
    printf("Ingrese X:\n");
    scanf("%d",&x);
    printf("Ingrese Y:\n");
    scanf("%d",&y);
    printf("Ingrese Z:\n");
    scanf("%d",&z);
    assert(z == z && y == y  && x == x);
    minimo (x,y,z);
    return 0;
}