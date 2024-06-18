#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
    int x, i;
    bool res;
	printf("Ingrese un valor numerico para x :\n"); 
	scanf("%d", &x); 
	printf("Ingrese un valor numerico para i :\n"); 
	scanf("%d", &i); 
    printf("Ingrese un valor booleano para res (Si es True: 1 , si es False: 0):\n"); 
	scanf("%d", &res); 
	printf("Usted ingreso x = %d, i = %d, res = %d\n",x,i,res); 
    
    i = 2;
    res = true;
	printf("Antes de entrar al ciclo las variables son: x = %d, i = %d, res = %d\n",x,i,res); 
        do {
            res = res and ((x % i) != 0);
            i = i + 1;
            printf("La Interaccion da: x = %d, i = %d, res = %d\n",x,i,res); 
        }
        while ((i < x) and res);
            printf("Las varibles de salida son: x = %d, i = %d, res = %d\n",x,i,res); 

	return 0;
	}
    /* 2)
La Interaccion da: (x = 5, i = 3, res = 1)
La Interaccion da: (x = 5, i = 4, res = 1)
La Interaccion da: (x = 5, i = 5, res = 1)
Respuesta:
Revisa si el numero ingresado es primo, si esto es asi, la variable i se iguala a la variable ingresada en x. Al mismo tiempo que la variable res indica True si x es primo y sino indica False.
Nota: Buscandole un sentido, note que si se cambia el orden de la linea en la que se suma i, 
y si se la coloca antes de la reasignacion de res. Incrementa i, hasta el menor multiplo 
por el cual divide a x y por el cual da resto cero.*/