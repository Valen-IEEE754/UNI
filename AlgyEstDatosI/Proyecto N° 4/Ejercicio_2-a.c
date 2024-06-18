#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

void minimo (int x, int y){
    int a,h,k;
    a = x;
    h = x + 1;
    k = a + y;
    printf("Los valores de x,y son: %d,%d\n",h,k);
}
int main (void){
    int x,y;
    int min;
    printf("Ingrese X:\n");
    scanf("%d",&x);
    printf("Ingrese Y:\n");
    scanf("%d",&y);
    assert(y == y  && x == x);
    minimo (x,y);
    return 0;
}