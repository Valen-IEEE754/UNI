/*
  @file weather_table.c
  @brief Weather table implementation
*/
#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "weather_table.h"

/**
 * @brief Write the content of the table 'a' into stdout.
 * @param[in] a table to dump in stdout
 */
void table_dump(WeatherTable a) {
    // Recorrer todos los años del arreglo
    for (unsigned int year = 0u; year < YEARS; ++year) {
        // Recorrer todos los meses (de enero a diciembre)
        for (month_t month = january; month <= december; ++month) {
            // Recorrer todos los días del mes
            for (unsigned int day = 0u; day < DAYS; ++day) {
                // Imprimir la fecha (año, mes, día)
                // Nota: Se ajustan los índices para mostrar valores reales:
                // - Año: se suma FST_YEAR al índice
                // - Mes: se suma 1 (ya que january=0)
                // - Día: se suma 1 (ya que el array empieza en 0)
                fprintf(stdout, "%u %u %u ", year + FST_YEAR, month + 1, day + 1);
                
                // Imprimir los datos climáticos para ese día
                weather_to_file(stdout, a[year][month][day]);
                
                // Nueva línea para el próximo día
                fprintf(stdout, "\n");
            }
        }
    }
}
/**
 * @brief Lee una tabla de información climática desde un archivo
 * @details Cada línea del archivo debe contener:
 *   <año> <mes> <día> <temp_media> <temp_max> <temp_min> <presión> <humedad> <precipitaciones>
 * @param a Tabla donde se almacenarán los datos leídos
 * @param filepath Ruta al archivo con los datos climáticos
 */
void table_from_file(WeatherTable a, const char *filepath) {
    // 1. ABRIR EL ARCHIVO
    FILE *file = fopen(filepath, "r");
    if (file == NULL) {
        fprintf(stderr, "Error: El archivo no existe o no se puede leer.\n");
        exit(EXIT_FAILURE);
    }

    unsigned int k_year, k_month, k_day;
    
    // 2. BUCLE PRINCIPAL DE LECTURA
    while (true) {
        // 2.1. LEER FECHA (PRIMEROS 3 VALORES)
        // Formato: año mes día (3 valores enteros sin signo)
        int res = fscanf(file, "%u %u %u", &k_year, &k_month, &k_day);
        
        // 2.2. VERIFICAR FIN DE ARCHIVO
        // feof() devuelve verdadero cuando se alcanza el final del archivo
        if (feof(file)) {
            // Salir del bucle normalmente si llegamos al final
            break;
        }
        
        // 2.3. VALIDAR LECTURA DE FECHA
        // fscanf debe devolver 3 si leyó los 3 valores correctamente
        if (res != 3) {
            fprintf(stderr, "Error: Formato de tabla inválido. Se esperaban 3 valores de fecha.\n");
            exit(EXIT_FAILURE);
        }

        // 3. LEER DATOS CLIMÁTICOS (6 VALORES RESTANTES)
        // Esta función lee: temp_media, temp_max, temp_min, presión, humedad, precipitaciones
        Weather weather = weather_from_file(file);
        
        // 3.1. VERIFICAR FIN DE ARCHIVO DESPUÉS DE LEER CLIMA
        // Podría haber un archivo truncado (con fecha pero sin datos climáticos)
        if (feof(file)) {
            fprintf(stderr, "Error: Archivo incompleto. Faltan datos climáticos para la fecha %u-%u-%u\n", 
                    k_year, k_month, k_day);
            exit(EXIT_FAILURE);
        }

        // 4. VALIDAR RANGOS DE FECHA
        // - Año entre FST_YEAR y FST_YEAR+YEARS-1
        // - Mes entre 1 (enero) y 12 (diciembre)
        // - Día entre 1 y DAYS (normalmente 31)
        if (k_year < FST_YEAR || k_year >= FST_YEAR + YEARS ||
            k_month < 1 || k_month > 12 ||
            k_day < 1 || k_day > DAYS) {
            fprintf(stderr, "Error: Fecha inválida en archivo: %u-%u-%u\n", k_year, k_month, k_day);
            exit(EXIT_FAILURE);
        }

        // 5. ALMACENAR EN TABLA MULTIDIMENSIONAL
        // Ajustar índices:
        // - Año: k_year - FST_YEAR (para que el primer año sea 0)
        // - Mes: k_month - 1 (para que enero sea 0)
        // - Día: k_day - 1 (para que el primer día sea 0)
        a[k_year - FST_YEAR][k_month - 1][k_day - 1] = weather;
    }

    // 6. CERRAR ARCHIVO
    // Siempre se debe cerrar el archivo cuando ya no se necesita
    fclose(file);
}