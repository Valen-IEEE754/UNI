#include <stdlib.h>
#include <stdio.h> 
#include <stdbool.h> 
#include <assert.h>

int abs (int x){
    if ( x < 0 ){ x = -x;}
    return x;
} 

int main (void){
    int x, a;
    printf("Ingrese X:\n");
    scanf("%d",&x);
    assert(x == x);
    a = abs (x);
    printf("El valor absoluto es: %d\n",a);
    assert((0<=a) && !(0>a));
    return 0;
}
/*
Derivacion por el formalismo basico (Valor Absoluto)

Var x, res : Int ;
{P: x=X }
S
{Q: (res=X ∧ X≥0) ∨ (res=-X ∧ X<0) }

wp.(res:=E).((res=X ∧ X≥0) ∨ (res=-X ∧ X<0))
    ≡ { aplico hipótesis }
wp.(res:=E).((res=x ∧ x≥0) ∨ (res=-x ∧ x<0))
    ≡ { separo por casos }

Caso 1  x≥0
        wp.(res:=E).((res=x ∧ x≥0) ∨ (res=-x ∧ x<0))
            ≡ { hipótesis de guarda y lógica }
        wp.(res:=E).((res=x ∧ True) ∨ (res=-x ∧ False))
            ≡ { absorbente de conjunción }
        wp.(res:=E).((res=x ∧ True) ∨ (False))
            ≡ { neutro de conjuncion}
        wp.(res:=E).((res=x ) ∨ ( False))
            ≡ { neutro de disyunción}
        wp.(res:=E).(res=x)
            ≡ { precondición mas débil de asignación }
        (res=x)(res ← E)
            ≡ { aplico substitución }
        E=x
            ≡ { tomo E = x }
        x=x
            ≡ { lógica }
        True

Caso 2 x<0
        wp.(res:=E).((res=x ∧ x≥0) ∨ (res=-x ∧ x<0))
            ≡ { hipótesis de guarda y lógica }
        wp.(res:=E).((res=x ∧ False) ∨ (res=-x ∧ True))
            ≡ { absorbente de conjunción }
        wp.(res:=E).((False) ∨ (res=-x ∧ True))
            ≡ { neutro de conjuncion }
        wp.(res:=E).(( False) ∨ (res=-x))
            ≡ { neutro de disyunción}
        wp.(res:=E).(res=-x)
            ≡ { precondición mas débil de asignación }
        (res=-x)(res ← E)
            ≡ { aplico substitución }
        E=-x
            ≡ { tomo E = -x }
        -x=-x
            ≡ { lógica }
        True


Var x, y, res : Int;
  { P: x = X }    (X variables de especificación)
  if x ≥ 0 →  res := x
  [] x < x →  res := -x
  fi
  { Q: (res=X ∧ X≥0) ∨ (res=-X ∧ X<0) }

*/