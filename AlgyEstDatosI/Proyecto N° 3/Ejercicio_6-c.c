#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
#include <tuple>

void funcion (int , int , int , int );

void funcion (int x, int y, int z, int m){
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
    }


int main (void){
    int x,y,z,m;
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
    
    funcion(x,y,z,m);

    return 0;
}

    /*
    En esta nueva version lo bueno es que se ingresan los datos por un lado y por otro se ejecuta la funcion. Las ventajas son que puedo ver donde estan los errores mas facilmente, teniendo en cuenta que uno suele  esperar que se una funcion pida y retorne algo, si ello no se cumple, da error, lo que permite no colapsar todo el codigo ( cosa que podria pasar cuando el si mismo es extenso). Ademas que si el codigo esta organizado, a este se le puede analizar de forma mas organizada.
    Otro codigo puede ser: 4 a
#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 

int funcion (int , int);
void imprimeEntero (int) ;

int funcion (int x, int y){
if (x >= y){
    x = 0;
    }else{
    x = 2;
    }
    return x;
}

void imprimeEntero (int x) {
    printf("El nuevo valor de x es: %d\n",x);
}

int main(void)            
 {
int x, y;
printf("Ingrese un valor numerico para x :\n"); 
scanf("%d", &x); 
printf("Ingrese un valor numerico para y :\n"); 
scanf("%d", &y); 
imprimeEntero(funcion(x,y));
	return 0;
}
*/