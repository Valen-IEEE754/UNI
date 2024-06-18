#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h> 
#include <limits.h>
#define N 2
typedef char clave_t;
typedef int valor_t;
 
struct asoc{
  clave_t clave;
  valor_t valor;
};
 
bool asoc_existe(struct asoc a[], int tam, clave_t c)
{
  int i = 0;
  bool res = false;
  while(i<tam)
  {
    res = res || a[i].clave == c;
    i = i + 1;
  }
  return res;
}



int main (void){
  struct asoc a[N];
  clave_t c = 0;

  int i = 0; 
  while (i<N)
  {
    printf("Ingrese la clave para n: %d\n",i);
    scanf(" %c", &a[i].clave);
    printf("Ingrese la valor correspondiente:\n");
    scanf("%d", &a[i].valor);
    i = i + 1;
  }
  printf("Ingrese la clave a buscar:\n");
  scanf("%c", &c);
    bool res;
    res = asoc_existe(a,N,c);
  if (res == true){printf("Existe la clave buscada\n");}
  else {printf("No existe la clave buscada\n");}
  return 0;
}