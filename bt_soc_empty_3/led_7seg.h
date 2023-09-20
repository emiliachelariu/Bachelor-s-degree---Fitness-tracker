/*
 * led_7seg.h
 *
 *  Created on: 27 iun. 2023
 *      Author: Chelariu Emilia
 */

#ifndef LED_7SEG_H_
#define LED_7SEG_H_

#ifdef __cplusplus
extern "C" {
#endif

#include "sl_status.h"

#define LED_7SEG_ENABLE_GPIO_PORT                   gpioPortB
#define LED_7SEG_ENABLE_GPIO_PIN                    4

/***************************************************************************//**
 * @brief
 *   Initialize led_7seg_init.
 *
 * @detail
 *  The SPI driver instances will be initialized automatically,
 *  during the sl_system_init() call in main.c.
 *****************************************************************************/
sl_status_t led_7seg_init(void);

/***************************************************************************//**
 * @brief
 *    Write a number on LED 7-segment display via SPI interface.
 *
 * @note
 *    The data received on the MISO wire is discarded.
 *    @n This function is blocking and returns when the transfer is complete.
 *
 * @param[in] number
 *    Transmit number that will display on the 7-segment.
 *
 * @return
 *    @ref SL_STATUS_OK on success or @ref SL_STATUS_FAIL on failure
 ******************************************************************************/
sl_status_t led_7seg_display_number(uint8_t number);

/***************************************************************************//**
 * @brief
 *   Turn on display.
 *
 *****************************************************************************/
void led_7seg_display_on(void);

/***************************************************************************//**
 * @brief
 *   Turn off display.
 *
 *****************************************************************************/
void led_7seg_display_off(void);

#ifdef __cplusplus
}
#endif

#endif /* LED_7SEG_H_ */
