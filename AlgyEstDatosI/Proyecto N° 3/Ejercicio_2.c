#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
    int x = 0;
    int y = 0;
    int z = 0;
    int b,w;
    printf("Ingrese un valor para x :\n"); 
	scanf("%d", &x);
    printf("Ingrese un valor para y :\n"); 
	scanf("%d", &y);
    printf("Ingrese un valor para z :\n"); 
	scanf("%d", &z);
    printf("Ingrese un valor booleano para b (1 si es True o 0 si es False) :\n"); 
	scanf("%d", &b);
    printf("Ingrese un valor booleano para w (1 si es True o 0 si es False):\n"); 
	scanf("%d", &w);
	printf("El sistema inicia con x=%d, y=%d, z=%d, b=%d, w=%d;\n",x,y,z,b,w); 
    if ((not b && w)== false){
         if (x % 4 == 0){
                if (x + y == 0){
                    	if (y - x == (-1) * z){ 
                            printf("x=%d, y=%d, z=%d, b=%d, w=%d;",x,y,z,b,w);
                        }else{printf("y - x == (-1) * z no se cumple"); }
                        }else{printf("x + y == 0 no se cumple"); }
                        }else{printf("X no es multiplo de 4"); }
                        }else{printf("Va a estar mal por que not b && w va a dar true por las reglas de la conjuncion"); }

	return 0;
	}
/*    Valores posibles son:
    (x=0, y=0, z=0, b=0, w=0);
    (x=4, y=-4, z=8, b=1, w=0);
    (x=8, y=-8, z=16, b=1, w=1);
*/