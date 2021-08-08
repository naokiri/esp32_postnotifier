#include <stdio.h>
#include <float.h>
#include "esp_system.h"
#include "esp_timer.h"
#include "rom/ets_sys.h"
#include "HCSR04.h"
#include "driver/gpio.h"

#define TRIG_PIN 17
#define ECHO_PIN 18

/**
 * 0 success
 * 1 timeout
 */
int busy_wait_pin(int pin, int level, int64_t max_wait_time_us, int64_t start_time_us) {
     while(gpio_get_level(pin) != level){
        if(esp_timer_get_time() - start_time_us > max_wait_time_us) {
            return 1;
        }
    }
    return 0;
}


#define MAX_DISTANCE FLT_MAX
/**
 * Take ~20 us and return distance in meter using HC-SR04 
 * Assuming fixed sonic speed of 350m/s
 */
float get_distance() {
    const int64_t max_wait_time_us = 1 * SEC_TO_USEC;
    const int64_t start_time_us = esp_timer_get_time();

    // Send pulse. 10 us trig high.
    gpio_set_level(TRIG_PIN, 0);
    ets_delay_us(2);
    gpio_set_level(TRIG_PIN, 1);
    ets_delay_us(10);
    gpio_set_level(TRIG_PIN, 0);


    // Read echo pulse
    if (busy_wait_pin(ECHO_PIN, 0, max_wait_time_us, start_time_us)) {
        return MAX_DISTANCE;
    }
    if (busy_wait_pin(ECHO_PIN, 1, max_wait_time_us, start_time_us)) {
        return MAX_DISTANCE;
    }
    const int64_t pulse_start_us = esp_timer_get_time();
    if (busy_wait_pin(ECHO_PIN, 0, max_wait_time_us, start_time_us)) {
        return MAX_DISTANCE;
    }
    return (esp_timer_get_time() - pulse_start_us) / 2 * 0.00035;
}

void init_hcsr04_gpio() {
    gpio_config_t trig_pin_conf;
    trig_pin_conf.pin_bit_mask = (1ULL<<TRIG_PIN);
    trig_pin_conf.intr_type = GPIO_INTR_DISABLE;    
    trig_pin_conf.mode = GPIO_MODE_OUTPUT;    
    trig_pin_conf.pull_down_en = 0;    
    trig_pin_conf.pull_up_en = 0;    
    gpio_config(&trig_pin_conf);

    gpio_config_t echo_pin_conf;
    echo_pin_conf.pin_bit_mask = (1ULL<<ECHO_PIN);
    echo_pin_conf.intr_type = GPIO_INTR_ANYEDGE;
    echo_pin_conf.mode=GPIO_MODE_INPUT;
    echo_pin_conf.pull_down_en = 0;
    echo_pin_conf.pull_up_en = 0;
    gpio_config(&echo_pin_conf);
}