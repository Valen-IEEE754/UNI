#include "weather_utils.h"
#include <limits.h>

int historical_minimum_temp(WeatherTable table) {
    int min_temp = INT_MAX; // Inicializar con el máximo valor posible
    
    // Recorrer todos los años
    for (unsigned int year = 0; year < YEARS; year++) {
        // Recorrer todos los meses
        for (month_t month = january; month <= december; month++) {
            // Recorrer todos los días
            for (unsigned int day = 0; day < DAYS; day++) {
                // Comparar con la temperatura mínima actual
                if (table[year][month][day]._min_temp < min_temp) {
                    min_temp = table[year][month][day]._min_temp;
                }
            }
        }
    }
    
    return min_temp;
}

void annual_maximum_temps(WeatherTable table, int max_temps[YEARS]) {
    // Inicializar el arreglo de máximas
    for (unsigned int year = 0; year < YEARS; year++) {
        max_temps[year] = INT_MIN; // Inicializar con el mínimo valor posible
        
        // Buscar la máxima temperatura del año
        for (month_t month = january; month <= december; month++) {
            for (unsigned int day = 0; day < DAYS; day++) {
                if (table[year][month][day]._max_temp > max_temps[year]) {
                    max_temps[year] = table[year][month][day]._max_temp;
                }
            }
        }
    }
}

void annual_rainiest_months(WeatherTable table, month_t rainiest_months[YEARS]) {
    // Para cada año
    for (unsigned int year = 0; year < YEARS; year++) {
        unsigned int max_rainfall = 0;
        month_t rainiest_month = january;
        
        // Para cada mes
        for (month_t month = january; month <= december; month++) {
            unsigned int monthly_rainfall = 0;
            
            // Sumar las precipitaciones del mes
            for (unsigned int day = 0; day < DAYS; day++) {
                monthly_rainfall += table[year][month][day]._rainfall;
            }
            
            // Comparar con el máximo actual
            if (monthly_rainfall > max_rainfall) {
                max_rainfall = monthly_rainfall;
                rainiest_month = month;
            }
        }
        
        // Almacenar el mes más lluvioso del año
        rainiest_months[year] = rainiest_month;
    }
}