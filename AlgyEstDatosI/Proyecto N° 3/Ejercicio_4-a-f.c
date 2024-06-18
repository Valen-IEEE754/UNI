
#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
int x, y;
printf("Ingrese un valor numerico para x :\n"); 
scanf("%d", &x); 
printf("Ingrese un valor numerico para y :\n"); 
scanf("%d", &y); 

if (x >= y){
    x = 0;
    printf("El nuevo valor de x es: %d\n",x);
    }else{
    x = 2;
    printf("El nuevo valor de x es: %d\n",x);
    }
	return 0;
}