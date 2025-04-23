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

int charge_value(){
	int value;
	printf("Ingrese el valor a buscar: ");
	scanf("%d", &value);
	return value;
}
void charge_array(int arr[], unsigned int length){
	unsigned int i = 0;
	while(i < length){
		printf("Ingrese el valor de la posicion %u: ", i);
		scanf("%d", &arr[i]);
		i = i+1;
	}
}   
struct bound_data check_bound(int value, int arr[], unsigned int length) {
    struct bound_data res;  
    res.is_upperbound = true;
    res.is_lowerbound = true;
    res.exists = false;
    res.where = 0;
    unsigned int i = 0;
    while(i < length && (res.is_lowerbound || res.is_upperbound|| !res.exists)){
        res.is_lowerbound = arr[i] >= value && res.is_lowerbound;
        res.is_upperbound = arr[i] <= value && res.is_upperbound;
        if(arr[i] == value){
            res.exists = true;
            res.where = i;
        }
        i = i+1;
    }
    //////////////////////////////////
        /*
        struct bound_data res;
        res.is_upperbound = true, res.is_lowerbound = true, res.exists = false;
        
        for (size_t i = 0; i < length; i++){
            if (value < arr[i]) {
            res.is_upperbound = false;
            } 
            else if (value > arr[i]){
            res.is_lowerbound = false;
            }
            else if (value == arr[i]) {
            res.exists = true;
            res.where = i;      // In this case, it takes the last occurrence.
        }}
        */

        /*

        struct bound_data res;   
        res.is_upperbound = true;
        res.is_lowerbound = true;
        res.exists = false;
        res.where = -1;
        unsigned int i = 0;
        while(i < length && (res.is_lowerbound || res.is_upperbound)){
            res.is_lowerbound = arr[i] >= value && res.is_lowerbound;
            res.is_upperbound = arr[i] <= value && res.is_upperbound;
            if(arr[i] == value){
                res.exists = true;
                res.where = i;
            }
            i = i+1;
        }
        */
        /*
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

        */
    return res;
}

int main(void) {

    int a[ARRAY_SIZE];
    int value;
    charge_array(a, ARRAY_SIZE);
    value = charge_value();
	struct bound_data result = check_bound(value, a, ARRAY_SIZE);
	
    if (result.is_upperbound && result.is_lowerbound) {
        printf("El valor %d es igual a todos los elementos del arreglo.\n", value);
        printf("Se encuentra en la posicion %u.\n", result.where);
    } else if (result.is_upperbound) {
        printf("El valor %d es cota superior del arreglo.\n", value);
        if (result.exists) {
            printf("Es el maximo y se encuentra en la posicion %u.\n", result.where);
        }
    } else if (result.is_lowerbound) {
        printf("El valor %d es cota inferior del arreglo.\n", value);
        if (result.exists) {
            printf("Es el minimo y se encuentra en la posicion %u.\n", result.where);
        }
    } else if (result.exists) {
        printf("El valor %d se encuentra en la posicion %u, pero no es cota.\n", value, result.where);
    } else {
        printf("El valor %d no es cota y no se encuentra en el arreglo.\n", value);
    }
    	return EXIT_SUCCESS;
}
/*
{
    int a[ARRAY_SIZE];
    for (size_t i = 0; i < ARRAY_SIZE; i++) 
    {
        printf("Ingrese el valor de la posicion %ld:\n", i);
        scanf("%d", &a[i]);
    }

    int value;
    printf("Ingrese el valor a comparar:\n");
    scanf("%d", &value);

    struct bound_data result = check_bound(value, a, ARRAY_SIZE);

    if (result.is_upperbound && result.exists) 
    {
        printf("El valor es un máximo y esta en la posicion %d\n", result.where);
    } 
    else if (result.is_upperbound)
    {
        printf("El valor es cota superior\n");

    }

    if (result.is_lowerbound && result.exists) 
    {
        printf("El valor es un mínimo y esta en la posicion %d\n", result.where);
    } 
    else if (result.is_lowerbound)
    {
        printf("El valor es cota inferior\n");

    }
    return EXIT_SUCCESS;
}
*/
/*{
    int a[ARRAY_SIZE];
    int value;
    charge_array(a, ARRAY_SIZE);
    value = charge_value();
	struct bound_data result = check_bound(value, a, ARRAY_SIZE);
	
  	if(result.is_lowerbound){
		printf("El valor %d es cota inferior del arreglo.\n", value);
		if(result.exists){
			printf("El valor %d existe en la posicion %u i.e. es el minimo.\n", value, result.where);
		}
	} if(result.is_upperbound){
			printf("El valor %d es cota superior del arreglo.\n", value);
			if(result.exists){
				printf("El valor %d existe en la posicion %u i.e. es el maximo.\n", value, result.where);
			}
	}
	return EXIT_SUCCESS;
}
    
    int charge_value(){
	int value;
	printf("Ingrese el valor a buscar: ");
	scanf("%d", &value);
	return value;
}
    void charge_array(int arr[], unsigned int length){
	unsigned int i = 0;
	while(i < length){
		printf("Ingrese el valor de la posicion %u: ", i);
		scanf("%d", &arr[i]);
		i = i+1;
	}
}
    */
/*
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



    */