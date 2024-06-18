#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

int minimo (int x, int y){
    int min;
    if (x>y){ min = y;
    printf("El minimo es: %d\n",y);
    }else{min = x;
    printf("El minimo es: %d\n",x);
    } 
    return min;
}
int main (void){
    int x,y;
    int min;
    printf("Ingrese X:\n");
    scanf("%d",&x);
    printf("Ingrese Y:\n");
    scanf("%d",&y);
    assert(y == y  && x == x);
    min = minimo (x,y);
    assert(min<=x && min<=y && (min==x|| min==y));
    return 0;
}

/*
Derivacion del formalismo basico (Minimo)

Var x,y,res : Int ; 
{P: x=X ∧ y=Y}
S
{Q: (res=X ∧ Y≥X) ∨ (res=Y ∧ Y<X) }

Tomo como hipótesis P : x=X ∧ y=Y
La asignación sera: res:= E.

wp.(res:=E).((res=X ∧ Y≥X) ∨ (res=Y ∧ Y<X))
    ≡ { aplico la hipótesis }
wp.(res:=E).((res=x ∧ y≥x) ∨ (res=y ∧ y<x))
≡ { asignación no funciona entonces pruebo por casos }

Caso 1  y≥x
        wp.(res:=E).((res=x ∧ y≥x) ∨ (res=y ∧ y<x))
            ≡ { hipótesis de guarda y lógica }
        wp.(res:=E).((res=x ∧ True) ∨ (res=y ∧ False))
        ≡ { absorbente de conjunción }
        wp.(res:=E).((res=x ∧ True) ∨ (False))
        ≡ { neutro}
        wp.(res:=E).((res=x) ∨ (False))
        ≡ { neutro de la disyuncion }    
        wp.(res:=E).(res=x)
            ≡ { precondición mas débil de asignación }
        (res=x)(res ← E)
            ≡ { Aplico substitución }
        E=x
            ≡ { Como E = x reemplazo }
        x=x
            ≡ { Lógica }
        True
            ≡ { Reflexibidad }

Caso 2  y<x
        wp.(res:=E).((res=x ∧ y≥x) ∨ (res=y ∧ y<x))
            ≡ { hipótesis de guarda y lógica }
        wp.(res:=E).((res=x ∧ False) ∨ (res=y ∧ True))
        ≡ { absorbente de conjunción }
        wp.(res:=E).((False) ∨ (res=y ∧ True))
        ≡ { neutro}
        wp.(res:=E).((False) ∨ (res=y))
        ≡ { neutro de la disyuncion }    
        wp.(res:=E).(res=y)
            ≡ { precondición mas débil de asignación }
        (res=y)(res ← E)
            ≡ { aplico substitución }
        E=y
            ≡ { tomo E = y }
        y=y
            ≡ { lógica }
        True

Var x, y, res : Int;
  { P: x = X ∧ y = Y }    (X e Y variables de especificación)
  if y ≥ x →  res := x
  [] y < x →  res := y
  fi
  { Q: (res=X ∧ Y≥X) ∨ (res=Y ∧ Y<X) }

*/