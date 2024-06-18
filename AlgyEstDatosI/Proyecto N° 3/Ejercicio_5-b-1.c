#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
    int x, y,i;
	printf("Ingrese un valor para x :\n"); 
	scanf("%d", &x); 
	printf("Ingrese un valor para y :\n"); 
	scanf("%d", &y);
    printf("Ingrese un valor para i :\n"); 
	scanf("%d", &i);
    i = 0;
	printf("Las variables son: x=%d, y=%d, i=%d\n",x,y,i); 
        do {
            x = x - y;
            i = i + 1;
            printf("La Interaccion da: x =%d, y =%d, i =%d\n",x,y,i);
        }
        while (x >= y);
        printf("Las varibles de salida son: x =%d, y =%d, i =%d\n",x,y,i);

	return 0;
	}
    /*Resp
1)
La Interaccion da: (x =10, y =3, i =1)
La Interaccion da: (x =7, y =3, i =2)
La Interaccion da: (x =4, y =3, i =3)
La Interaccion da: (x =1, y =3, i =4)
Respuesta:
Resta la variable y a x, i veces. Si no puede restar mas, las interacciones se terminan y 
el ciclo se cierra.

*/