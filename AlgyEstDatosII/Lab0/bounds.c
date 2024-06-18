#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

#define ARRAY_SIZE 4
struct bound_data {
    bool is_upperbound;
    bool is_lowerbound;
    bool exists;
    unsigned int where;
};
struct bound_data check_bound(int value, int arr[], unsigned int length) {
    struct bound_data r;
    r.is_upperbound=true;
    r.is_lowerbound=true;
    r.exists=false;
    r.where=0;
    int i;
    for (unsigned int i = 0; i < length; i++) {   
            if (arr[i] < value) {r.is_lowerbound=false;}
            if (arr[i] >= value){r.is_upperbound=false;}
            if (value == arr[i]) {
            r.exists = true;
            r.where = i;
    }
    }   
    return r;
}
void pedirArreglo(int array[], int n_max) {
    int i;
    i = 0;
    while (i < n_max) {
        printf("Ingrese el elemento %d del arreglo: \n", i);
        scanf("%d", &array[i]);
        i = i + 1;
    }
}
int pedirValue(){ 
    int value;
    printf("Escriba el value\n");
    scanf("%d", &value);
    return value;
}
int main(void) {
    int array[ARRAY_SIZE];    
    pedirArreglo(array, ARRAY_SIZE);
    int value = pedirValue();
    struct bound_data r = check_bound(value, array, ARRAY_SIZE);
    printf("F4\n");

    printf("Cota inferior: %d Cota superior: %d \n",r.is_lowerbound,r.is_upperbound);
    if (r.exists == true){
        if (r.is_upperbound== true){printf("Máximo: %d \n",r.is_upperbound);}
        if (r.is_lowerbound== true){printf("Minimo: %d\n",r.is_lowerbound);}
    printf("Posicion: %d\n",r.where);
    }
    return EXIT_SUCCESS;
}

