#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"

unsigned int fstring_length(fixstring s) {
unsigned int len = 0;
while (s[len] != '\0' && len < FIXSTRING_MAX)
{
    len++;
}
return len;
}

bool fstring_eq(fixstring s1, fixstring s2) {
    int i = 0;
    while (s1[i] != '\0' && s2[i] != '\0' && s1[i] == s2[i]) {
        i++;
    }
    return s1[i] == s2[i];  // Verifica si terminaron igual
}

bool fstring_less_eq(fixstring s1, fixstring s2) { 
    int i = 0; 
    // ciclo: buscar la primer posición en la que los strings NO coinciden. 
    // esta posición va a ser determinante para saber el resultado. 
    while (s1[i] == s2[i] && s1[i] != '\0') { 
        // invariante: todos los caracteres previos al i-ésimo coinciden 
        i++; 
    } 
    //nota se optimiza, evaluando los valores de las letras en código ASCII, por eso se puede hacer > o <
    //Tambien el  \0 es 0 y los valores de menor a mayor repecto al alfabeto, a empieza como en 97 y b es 98 y asi...
    // salimos del ciclo: 
    // acá vale el invariante  
    // y la negación de la guarda: s1[i] != s2[i] || s1[i] == '\0' 
 
    // posibilidades: 
    // 1. s1[i] < s2[i]: s1 va antes de s2 (incluso si s1[i] == '\0') 
    //    RESULTADO: true 
    // 2. s1[i] == s2[i]: luego s1[i] == '\0' == s2[i] y ambos strings son iguales  
    //    RESULTADO: true 
    // 3. s1[i] > s2[i]: s1 va después de s2 (incluso si s2[i] == '\0') 
    //    RESULTADO: false 
 
    // juntando 1 y 2 nos queda el resultado: 
    return s1[i] <= s2[i]; 
} 
 

