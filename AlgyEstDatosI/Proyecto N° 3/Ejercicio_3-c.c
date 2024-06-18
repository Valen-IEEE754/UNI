#include <stdio.h> 
int main(void)            
 {
	int x;
    int y;
    printf("Ingrese un valor para x :\n"); 
	scanf("%d", &x); 
	printf("Ingrese un valor para y :\n"); 
	scanf("%d", &y);  
    printf("El valor de x es: %d\n",x);
    printf("El valor de y es: %d\n",y);
    y = y + y;
    printf("El nuevo valor de y es: %d\n",y);
    x = x + y;
    printf("El nuevo valor de x es: %d\n",x);
	return 0;
	}

/*
Prog           | Us Ing σ0       |Us Sal σ
1.c Ejec 1  | x = 2  , y = 5   | x = 10 , y = 12 
1.c Ejec 2  | x =  0 , y = 0   | x = 0 , y = 0
1.c Ejec 3  | x = -2  , y = -5 | x = -10 , y = -12  */