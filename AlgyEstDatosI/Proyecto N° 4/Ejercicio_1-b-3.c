#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>


int camb (int x,int y){
    int z;
    z = x;
    x = y;
    y = z;
    printf("Valor de X ahora es: %d\n",x);
    printf("Valor de Y ahora es: %d\n",y);
} 
int main (void){
    int x,y,z;
    printf("Ingrese X:\n");
    scanf("%d",&x);
    printf("Ingrese Y:\n");
    scanf("%d",&y);
    assert(x == x && y == y);
    x,y = camb (x,y);
    assert(x == x && y == y);
    return 0;
}
/*
Derivacion por el formalismo basico: (Intercambio de variables)
{ P: x=X ∧ y=Y }
z := x ;                 | S1
x := y ;                 | S2
y := z                   | S3
{ Q: x=Y ∧ y=X }

{P}S1;S2;S3{Q}
    ≡ { verificación por precondición más débil de concatenación }
P => wp.(S1;(S2;S3)).Q 
    ≡ { precondición más débil de concatenación }
P => wp.S1.(wp.(S2;S3).Q)
    ≡ { precondición más débil de concatenación }
P => wp.S1.(wp.S2.(wp.S3.Q))
    ≡ { precondición más débil de asignación }
P => wp.S1.(wp.S2.(x=Y ∧ y=X)(y←z))
    ≡ { aplico substitución }
P => wp.S1.(wp.S2.(x=Y ∧ z=X))
    ≡ { precondición más débil de asignación }
P => wp.S1.((x=Y ∧ z=X)(x←y)
    ≡ { aplico substitución }
P => wp.S1.(y=Y ∧ z=X)
    ≡ { precondición más débil de asignación }
P => (y=Y ∧ z=X)(z←x)
    ≡ { aplico substitución }
P => (y=Y ∧ x=X)
    ≡ { lógica y reflexibilidad}
True


Var x, y, res : Int;
{ P: x=X ∧ y=Y }
    res := x ;                
    x := y ;                 
    y := res  ;    
{ Q: x=Y ∧ y=X }

*/