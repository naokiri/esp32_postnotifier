// #define LOG_LOCAL_LEVEL ESP_LOG_DEBUG
#include "HCSR04.h"
#include "esp_log.h"
#include "esp_netif.h"
#include "esp_sleep.h"
#include "esp_spi_flash.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "nvs_flash.h"
#include "post_notifier.h"
#include "wifi_initializer.h"
#include "notifier.h"
#include "battery_checker.h"
#include <stdio.h>

extern int wake_count;

static const char *TAG = "PostNotifier";
static TaskHandle_t xTaskToNotify;

#define ALERT_THRESHOLD_M 0.15
#define BATTERY_VOLTAGE_THRESHOLD_MV 3650

#define BATTERY_CTRL_PIN 25

void init_nvs() {
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES ||
        ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK(ret);
}

void app_main(void) {
    ESP_LOGI(TAG, "Hello world %d-th time.", wake_count);
    // Somehow LOG_LOCAL_LEVEL doesn't work.
    //esp_log_level_set(TAG, ESP_LOG_DEBUG);

    init_battery_divider_gpio(BATTERY_CTRL_PIN);

    uint32_t battery_voltage = get_battery_level();
    if (battery_voltage < BATTERY_VOLTAGE_THRESHOLD_MV) {
        // Oh no. Halt to save the battery.
        ESP_LOGI(TAG, "No more battery. Halting.");
        // esp_deep_sleep_start();
        return;
    }

    init_hcsr04_gpio();

    if (wake_count > 0) {
        ESP_LOGD(TAG, "Not first wakeup\n");
        float distance = get_distance();
        ESP_LOGD(TAG, "distance: %f\n", distance);
        if (distance < ALERT_THRESHOLD_M) {
            ESP_LOGD(TAG, "Something in close distance\n");
            init_nvs();
            // Feed watchdog timer
            vTaskDelay(1);
            xTaskToNotify = xTaskGetCurrentTaskHandle();
            xTaskCreate(&init_wifi_task, "wifi_initializer", 5000,
                        &xTaskToNotify, 1, NULL);
            vTaskDelay(1);
            uint32_t ret = ulTaskNotifyTake(pdTRUE, pdMS_TO_TICKS(30000));
            if (ret != 1) {
                ESP_LOGW(TAG, "Wifi connection failed. Abort for this time");
            } else {
                ESP_LOGD(TAG, "Wifi Success");
                notify_home();
                esp_wifi_disconnect();
            }
        }
    }
    fflush(stdout);
    wake_count++;

    // vTaskDelay(10000);
    esp_sleep_enable_timer_wakeup(7 * HOUR_TO_USEC);
    // esp_sleep_enable_timer_wakeup(20 * SEC_TO_USEC);
    esp_deep_sleep_start();
}
