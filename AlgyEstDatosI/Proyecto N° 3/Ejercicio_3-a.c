#include <stdio.h> 
int main(void)            
 {
	int x;
    printf("Ingrese un valor para x :\n"); 
	scanf("%d", &x);
    printf("El valor de x es: %d\n",x);
    x = 5;
    printf("El valor de x es: %d\n",x);
	return 0;
	}
	/*
Us =Usuario     Ing = Ingresa  Sal = Salida
Prog           | Us Ing σ0       |Us Sal σ
1.a Ejec 1  |  x = 1              | 5
1.a Ejec 2  |  x = 0              | 5
1.a Ejec 3  |  x = -1             | 5
*/