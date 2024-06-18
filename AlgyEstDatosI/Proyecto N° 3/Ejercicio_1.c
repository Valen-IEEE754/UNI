#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
    int x, y, z;
	float a, b, c;
	printf("Ingrese un valor para x :\n"); 
	scanf("%d", &x); 
	a = x;
	printf("Ingrese un valor para y :\n"); 
	scanf("%d", &y); 
	b = y;
	printf("Ingrese un valor para z :\n"); 
	scanf("%d", &z); 
	c = z;
	printf("x + y + 1 == %d\n",x + y + 1);
    printf("z * z + y * 45 - 15 * x =%d\n", z * z + y * 45 - 15 * x); 

    printf("y - 2 == (x * 3 + 1) % 5 = "); 
	if (((y - 2) == (x * 3 + 1) % 5 ) == 1){printf("True\n"); }
	if (((y - 2) == (x * 3 + 1) % 5 ) == 0){printf("False\n"); }
    printf("y / 2 = %f\n", b / 2 ); 
    printf("y < x * z = ");
	if ((b < (a * c) ) == 1){printf("True\n"); }
	if ((b < (a * c) ) == 0){printf("False\n"); }
	return 0;
	}
	/*
	Los resultados de la primera columna son: (x→7, y→3, z→5)
		x + y + 1 == 11
		z * z + y * 45 - 15 * x = 55
		y - 2 == (x * 3 + 1) % 5 = False
		y / 2 = 1.500000
		y < x * z = True
	Los resultados de la segunda columna son: (x→1, y→10, z→8)
	x + y + 1 == 12
	z * z + y * 45 - 15 * x = 499
	y - 2 == (x * 3 + 1) % 5 = False
	y / 2 = 5.000000
	y < x * z = False
	
	La ultima exprecion es de tipo bool
		*/