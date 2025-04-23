/* First, the standard lib includes, alphabetically ordered */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include <string.h>
/* Then, this project's includes, alphabetically ordered */
#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"

/* Maximum allowed length of the array */
static const unsigned int MAX_SIZE = 100000u;

void print_help(char *program_name) {
    /* Print the usage help of this program. */
    printf("Usage: %s <input file path>\n\n"
           "Sort an array given in a file in disk.\n"
           "\n"
           "The input file must have the following format:\n"
           " * The first line must contain only a positive integer,"
           " which is the length of the array.\n"
           " * The second line must contain the members of the array"
           " separated by one or more spaces. Each member must be an integer."
           "\n\n"
           "In other words, the file format is:\n"
           "<amount of array elements>\n"
           "<array elem 1> <array elem 2> ... <array elem N>\n\n",
           program_name);
}

char *parse_filepath(int argc, char *argv[]) {
    /* Parse the filepath given by command line argument. */
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);
        exit(EXIT_FAILURE);
    }

    result = argv[1];

    return result;
}

void print_stats(const char *sort_name, int array[], unsigned int length) {
    /* Reset counters and timer */
    reset_comparisons_counter();
    reset_swaps_counter();
    set_current_time();
/*
    * strcmp() - Comparación de strings en C
    * ------------------------------------
    * Retorna:
    *   0  -> Strings IDÉNTICOS
    *   <0 -> str1 es MENOR que str2 (en orden ASCII)
    *   >0 -> str1 es MAYOR que str2
    * 
    * Compara carácter por carácter (valores ASCII):
    * 1. Compara primeros caracteres distintos encontrados
    * 2. Si todos coinciden en el string más corto, el más largo es mayor
    * 
    * Ejemplos:
    * strcmp("a", "a")    == 0   // Iguales
    * strcmp("a", "b")    < 0    // 'a'(97) < 'b'(98)
    * strcmp("banana", "apple") > 0  // 'b' > 'a'
    * strcmp("apple", "apples") < 0  // Mismos inicios, pero primero es más corto
    * 
    * Uso típico:
    * if (strcmp(str1, str2) == 0) { // Strings iguales }
*/  

    /* Perform sorting */
    if (strcmp(sort_name, "selection") == 0) {
        selection_sort(array, length);
    } else if (strcmp(sort_name, "insertion") == 0) {
        insertion_sort(array, length);
    } else if (strcmp(sort_name, "quick") == 0) {
        quick_sort(array, length);
    }
    
    /* Print statistics */
    printf("statistics for %s_sort\n", sort_name);
    printf("time elapsed=%g,    comparisons: %10u,    swaps: %10u\n", 
           calculate_elapsed_time(), comparisons_number(), swaps_number());
}
/*
 * Explicación de const char *sort_name:
 * -----------------------------------
 * sort_name es un puntero a string constante que recibe el nombre del algoritmo.
 * 
 * Cómo sabe qué función ejecutar:
 * 1. Los strings "selection"/"insertion"/"quick" son valores literales
 *    que actúan como identificadores convencionales.
 *    
 * 2. No están definidos como variables globales, sino que:
 *    - Se pasan directamente como argumentos (ej: "selection")
 *    - Se comparan con strcmp() dentro de print_stats()
 *    
 * 3. La relación algoritmo-nombre se establece MANUALMENTE en:
 *    if (strcmp(sort_name, "selection") == 0) {
 *        selection_sort(array, length); // ← Aquí se hace el vínculo
 *    }
 *    
 * Es case-sensitive y debe coincidir exactamente con los strings
 * usados en las comparaciones.
 */
int main(int argc, char *argv[]) {
    char *filepath = NULL;

    /* Parse the filepath */
    filepath = parse_filepath(argc, argv);

    /* Create and fill the array */
    int array[MAX_SIZE];
    unsigned int length = array_from_file(array, MAX_SIZE, filepath);

    /* Create copies for each algorithm */
    int selection_copy[MAX_SIZE];
    int insertion_copy[MAX_SIZE];
    int quick_copy[MAX_SIZE];
    
    array_copy(selection_copy, array, length);
    array_copy(insertion_copy, array, length);
    array_copy(quick_copy, array, length);

    /* Run and compare all sorting algorithms */
    print_stats("selection", selection_copy, length);
    print_stats("insertion", insertion_copy, length);
    print_stats("quick", quick_copy, length);

    return EXIT_SUCCESS;
}
