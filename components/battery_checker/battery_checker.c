#include "battery_checker.h"
#include "driver/adc.h"
#include "esp_adc_cal.h"
// #define LOG_LOCAL_LEVEL ESP_LOG_DEBUG
#include "esp_log.h"

static const char *TAG = "BatteryChecker";

/**
 * Assume that
 * 1. Power is connected to Pin 0.
 * 2. Power is Divided by 2.
 * Supposing Firebeetle ESP32 board. 
 * Also confirmed it works with Firebeetle2 ESP32-E board.
 *
 * Cannot be used at the same time with WiFi because of the ADC2 limitation.
 * 
 * Returns battery voltage in mV
 */
uint32_t get_battery_level() {
    // attenuation 11db because supposing LiPo battery (~3000-4200mV) or 2x dry cell
    // battery (2x ~1000-1500mV)

    ESP_ERROR_CHECK(adc2_config_channel_atten(ADC2_CHANNEL_1, ADC_ATTEN_11db));

    esp_adc_cal_characteristics_t adcChar;
    ESP_ERROR_CHECK(esp_adc_cal_characterize(ADC_UNIT_2, ADC_ATTEN_DB_11,
                                             ADC_WIDTH_BIT_12, 1100, &adcChar));
    uint32_t voltage;
    ESP_ERROR_CHECK(
        esp_adc_cal_get_voltage(ADC_CHANNEL_1, &adcChar, &voltage));

    ESP_LOGD(TAG, "Voltage: %d", voltage);

    return voltage;
}