#include "battery_checker.h"
#include "driver/adc.h"
#include "driver/gpio.h"
#include "esp_adc_cal.h"

// #define LOG_LOCAL_LEVEL ESP_LOG_DEBUG
#include "esp_log.h"

static const char *TAG = "BatteryChecker";
int ctrl_pin = 0;

void init_battery_divider_gpio(int pin_num) {
    gpio_config_t ctrl_pin_conf;
    ctrl_pin_conf.pin_bit_mask = (1ULL << pin_num);
    ctrl_pin_conf.intr_type = GPIO_INTR_DISABLE;
    ctrl_pin_conf.mode = GPIO_MODE_OUTPUT;
    ctrl_pin_conf.pull_down_en = 0;
    ctrl_pin_conf.pull_up_en = 0;
    gpio_config(&ctrl_pin_conf);
    gpio_set_level(pin_num, 0);
    ctrl_pin = pin_num;
}

/**
 * switch battery voltage divider
 *
 * If isEnable is true, turn on.
 * If isEnable is false, turn off.
 **/
void battery_divider_control(bool isEnable) {
    if (isEnable) {
        gpio_set_level(ctrl_pin, 1);
    } else {
        gpio_set_level(ctrl_pin, 0);
    }    
    ets_delay_us(10);
}

/**
 * Multisample get voltage
 */
uint32_t get_voltage(esp_adc_cal_characteristics_t *adcChar) {
    uint32_t sum = 0;
    int adc_reading;
    for (int i = 0; i < 32; i++) {        
        //adc_reading = adc2_get_raw(ADC_CHANNEL_9, ADC_WIDTH_12Bit, &adc_reading);
        ESP_ERROR_CHECK(adc2_get_raw(ADC_CHANNEL_9, ADC_WIDTH_12Bit, &adc_reading));
        sum += adc_reading;        
        ESP_LOGD(TAG, "Adc reading: %d", adc_reading);
    }
    return esp_adc_cal_raw_to_voltage(sum/32, adcChar);    
}

/**
 * Assume that
 * 1. Power is connected to GPIO Pin 26. (ADC2 ch9)
 * 2. Power is Divided by 2.
 *
 * Returns battery voltage in mV
 */
uint32_t get_battery_level() {
    // attenuation 11db because supposing LiPo battery (~3000-4200mV) or 3x dry
    // cell battery (3x ~1000-1500mV) divided by 2

    adc_power_acquire();
    //adc_gpio_init(ADC_UNIT_1, ADC_CHANNEL_0);
    adc_gpio_init(ADC_UNIT_2, ADC_CHANNEL_9);
    //ESP_ERROR_CHECK(adc1_config_channel_atten(ADC1_CHANNEL_0, ADC_ATTEN_11db));
    ESP_ERROR_CHECK(adc2_config_channel_atten(ADC2_CHANNEL_9, ADC_ATTEN_11db));

    esp_adc_cal_characteristics_t adcChar;
    // ESP_ERROR_CHECK(esp_adc_cal_characterize(ADC_UNIT_1, ADC_ATTEN_DB_11,
    //                                          ADC_WIDTH_BIT_12, 1100, &adcChar));
    ESP_ERROR_CHECK(esp_adc_cal_characterize(ADC_UNIT_2, ADC_ATTEN_DB_11,
                                             ADC_WIDTH_BIT_12, 1100, &adcChar));

    battery_divider_control(true);
    uint32_t voltage = get_voltage(&adcChar);
    battery_divider_control(false);
    ESP_LOGD(TAG, "Raw Voltage: %dmV", voltage);
    adc_power_release();
    return voltage * 2;
}