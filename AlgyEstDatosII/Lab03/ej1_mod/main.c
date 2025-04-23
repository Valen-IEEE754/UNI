/*
  @file main.c
  @brief Define la función principal del programa
*/

/* Inclusión de librerías estándar en orden alfabético */
#include <assert.h>  // Para aserciones
#include <stdio.h>   // Para entrada/salida
#include <stdlib.h>  // Para funciones estándar

/* Inclusión de headers del proyecto en orden alfabético */
#include "weather_table.h"  // Para manejo de tablas climáticas
#include "weather_utils.h"  // Para las nuevas funciones de análisis

/**
 * @brief Muestra ayuda de uso del programa
 * @param[in] program_name Nombre del ejecutable
 * 
 * Esta función muestra al usuario cómo usar correctamente el programa,
 * incluyendo el formato requerido del archivo de entrada.
 */
void print_help(char *program_name) {
    printf("Uso: %s <ruta al archivo de entrada>\n\n"
           "Carga y analiza datos climáticos de un archivo.\n\n"
           "El archivo debe existir y cada línea debe tener el formato:\n"
           "<año> <mes> <día> <temperatura> <máxima> <mínima> <presión> <humedad> <precipitaciones>\n\n"
           "El programa realizará:\n"
           "1. Mostrará la tabla climática completa\n"
           "2. Calculará la temperatura mínima histórica\n"
           "3. Encontrará las temperaturas máximas anuales\n"
           "4. Determinará el mes más lluvioso de cada año\n\n",
           program_name);
}

/**
 * @brief Muestra los resultados del análisis climático
 * @param min_temp Temperatura mínima histórica
 * @param max_temps Arreglo de temperaturas máximas anuales
 * @param rainiest_months Arreglo de meses más lluviosos por año
 * 
 * Esta función formatea y presenta los resultados de los análisis
 * de manera clara y organizada para el usuario.
 */
void display_results(int min_temp, int max_temps[YEARS], month_t rainiest_months[YEARS]) {
    // Nombres de los meses para mostrar en lugar de números
    const char *month_names[] = {
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
        "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"
    };
    
    printf("\n=== RESULTADOS DEL ANÁLISIS ===\n");
    
    // 1. Mostrar temperatura mínima histórica
    printf("\n1. Temperatura mínima histórica: %.1f°C\n", min_temp / 10.0);
    
    // 2. Mostrar temperaturas máximas anuales
    printf("\n2. Temperaturas máximas anuales:\n");
    printf("Año\tTemp Máx (°C)\n");
    printf("----\t-------------\n");
    for (unsigned int year = 0; year < YEARS; year++) {
        printf("%d\t%.1f\n", year + FST_YEAR, max_temps[year] / 10.0);
    }
    
    // 3. Mostrar meses más lluviosos por año
    printf("\n3. Mes más lluvioso cada año:\n");
    printf("Año\tMes más lluvioso\n");
    printf("----\t----------------\n");
    for (unsigned int year = 0; year < YEARS; year++) {
        printf("%d\t%s\n", year + FST_YEAR, month_names[rainiest_months[year]]);
    }
    printf("\n");
}

/**
 * @brief Obtiene la ruta del archivo desde los argumentos de línea de comandos
 * @param[in] argc Cantidad de argumentos
 * @param[in] argv Arreglo de argumentos
 * @return La ruta al archivo de datos climáticos
 * 
 * Esta función valida que se haya proporcionado un argumento con la ruta al archivo
 * y muestra ayuda si no se proporcionan los argumentos correctos.
 */
char *parse_filepath(int argc, char *argv[]) {
    char *result = NULL;

    if (argc < 2) {
        print_help(argv[0]);  // Mostrar ayuda si no hay argumentos
        exit(EXIT_FAILURE);   // Salir con error
    }

    result = argv[1];  // El primer argumento es la ruta al archivo

    return result;
}

/**
 * @brief Función principal del programa
 * @param[in] argc Cantidad de argumentos
 * @param[in] argv Arreglo de argumentos
 * @return EXIT_SUCCESS si el programa termina correctamente, EXIT_FAILURE en caso de error
 * 
 * Esta función coordina todo el flujo del programa:
 * 1. Procesa los argumentos de línea de comandos
 * 2. Carga los datos climáticos desde el archivo
 * 3. Muestra los datos crudos
 * 4. Realiza los análisis requeridos
 * 5. Muestra los resultados de los análisis
 */
int main(int argc, char *argv[]) {
    char *filepath = NULL;

    // 1. Obtener ruta al archivo desde los argumentos
    filepath = parse_filepath(argc, argv);

    // 2. Crear la tabla para almacenar los datos climáticos
    WeatherTable table;

    // 3. Cargar datos desde el archivo a la tabla
    table_from_file(table, filepath);

    // 4. Mostrar todos los datos climáticos en pantalla
    printf("=== DATOS CLIMÁTICOS COMPLETOS ===\n");
    table_dump(table);

    // 5. Realizar análisis de datos
    int min_temp = historical_minimum_temp(table);  // Temperatura mínima histórica
    int max_temps[YEARS];                          // Arreglo para máximas anuales
    month_t rainiest_months[YEARS];                // Arreglo para meses más lluviosos
    
    annual_maximum_temps(table, max_temps);        // Calcular máximas anuales
    annual_rainiest_months(table, rainiest_months); // Calcular meses más lluviosos
    
    // 6. Mostrar resultados de los análisis
    display_results(min_temp, max_temps, rainiest_months);

    return EXIT_SUCCESS;
}