/*
  @file weather.c
  @brief Implements weather mesuarement structure and methods
*/
#include <stdlib.h>
#include "weather.h"

Weather weather_from_file(FILE* file)
{
    Weather weather;
    
    // Leer los 6 valores climáticos del archivo:
    // 1. Temperatura promedio (en décimas de grado)
    // 2. Temperatura máxima (en décimas de grado)
    // 3. Temperatura mínima (en décimas de grado)
    // 4. Presión atmosférica (en décimas de hPa)
    // 5. Humedad (porcentaje)
    // 6. Precipitaciones (en centésimas de mm)
    int res = fscanf(file, "%d %d %d %u %u %u", 
                    &weather._average_temp,
                    &weather._max_temp,
                    &weather._min_temp,
                    &weather._pressure,
                    &weather._moisture,
                    &weather._rainfall);
    
    // Verificar que se hayan leído correctamente los 6 valores
    if (res != 6) {
        fprintf(stderr, "Invalid weather data.\n");
        exit(EXIT_FAILURE);
    }

    return weather;
}

void weather_to_file(FILE* file, Weather weather)
{
    fprintf(file, "%d %d %d %u %u %u", weather._average_temp,
            weather._max_temp, weather._min_temp, weather._pressure, weather._moisture, weather._rainfall);
}