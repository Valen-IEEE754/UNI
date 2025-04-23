#ifndef WEATHER_UTILS_H
#define WEATHER_UTILS_H

#include "weather.h"
#include "weather_table.h"  // Incluir para usar las definiciones existentes

/**
 * @brief Obtiene la temperatura mínima histórica registrada
 * @param[in] table Tabla de datos climáticos
 * @return La menor temperatura mínima registrada (en décimas de grado)
 */
int historical_minimum_temp(WeatherTable table);

/**
 * @brief Registra las temperaturas máximas anuales
 * @param[in] table Tabla de datos climáticos
 * @param[out] max_temps Arreglo donde se almacenarán las máximas por año
 */
void annual_maximum_temps(WeatherTable table, int max_temps[YEARS]);

/**
 * @brief Registra los meses con mayor precipitación anual
 * @param[in] table Tabla de datos climáticos
 * @param[out] rainiest_months Arreglo donde se almacenarán los meses más lluviosos por año
 */
void annual_rainiest_months(WeatherTable table, month_t rainiest_months[YEARS]);

#endif