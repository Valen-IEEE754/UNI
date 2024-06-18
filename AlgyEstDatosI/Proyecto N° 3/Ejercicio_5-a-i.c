#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
int main(void)            
 {
    int i;
	printf("Ingrese un valor para i :\n"); 
	scanf("%d", &i);
	printf("Usted ingreso i : %d\n",i); 
        do {
            i = 0;
            printf("i ahora vale: i =%d\n",i);
        }
        while (i != 0);
        
	return 0;
}