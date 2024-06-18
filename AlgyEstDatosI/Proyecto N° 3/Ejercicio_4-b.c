#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
    int x, y, z, m;
	printf("Ingrese un valor para x :\n"); 
	scanf("%d", &x); 
	printf("Ingrese un valor para y :\n"); 
	scanf("%d", &y); 
	printf("Ingrese un valor para z :\n"); 
	scanf("%d", &z); 
	printf("Ingrese un valor para m :\n"); 
	scanf("%d", &m); 
	printf("Usted ingreso x=%d, y=%d, z=%d, m=%d\n",x,y,z,m); 
    printf("σ0 x=%d, y=%d, z=%d, m=%d\n",x,y,z,m); 

            if (x < y){
        m = x;
        }
        else{
            m = y;
            }
            printf("σ1 x=%d, y=%d, z=%d, m=%d\n",x,y,z,m); 
            if (m >= z){
            m = z;
         }
        printf("σ2 x=%d, y=%d, z=%d, m=%d\n",x,y,z,m); 
        printf("Las varibles de salida ahora son: x =%d, y =%d, z =%d, m =%d \n",x,y,z,m);

	return 0;
	}

    /* Los estados son;
σ0
(x=5, y= 4, z=8, m=0)
σ1
(x=5, y= 4, z=8, m=4)
σ2
(x=5, y= 4, z=8, m=4)

Respuesta:
El valor final de la funcion, es el menor numero ingresado de entre las tres variables x, y, z,
esta siendo guardada en m y entregado la como resultado a la salida del programa*/