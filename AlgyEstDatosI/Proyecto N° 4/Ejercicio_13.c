#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
#include <limits.h>

bool es_primo (int N){
 int i = 2;
 bool res = true;
if (N == 0 || N == 1 || N == 4) {res = false;}
 while (i <= N/2){
    i++;
    if (N % i == 0){
        res = false;
    }
 }
 return res;
}

int nesimo_primo(int tam){
    int i=0,res=0;
    while (i != tam)
    {   
        res = res + 1;
        if (es_primo(res)){i= i + 1;}
    }
    return res;
}
int main (void){
    int x;
    printf("Igresar un numero nprimo positivo\n");
    scanf("%d",&x);
    assert(x>=0);
    printf("El primo que buscas es %d\n",nesimo_primo(x));
    return 0;
}