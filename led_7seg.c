/*
 * led_7seg.c
 *
 *  Created on: 27 iun. 2023
 *      Author: Chelariu Emilia
 */


#include <led_7seg.h>
#include "em_cmu.h"
#include "em_gpio.h"
#include "spidrv.h"
#include "sl_spidrv_instances.h"

#include "sl_sleeptimer.h"
#define spi_handle    sl_spidrv_mikroe_handle

static const uint8_t number_array[16] =
{
    0x7E,  // 0
    0x0A,  // 1
    0xB6,  // 2
    0x9E,  // 3
    0xCA,  // 4
    0xDC,  // 5
    0xFC,  // 6
    0x0E,  // 7
    0xFE,  // 8
    0xDE,  // 9
    0xEE,  // A
    0xF8,  // B
    0x74,  // C
    0xBA,  // D
    0xF4,  // E
    0xE4   // F
};

/***************************************************************************//**
 * @brief
 *   Initialize led_7seg_init.
 *
 * @detail
 *  The SPI driver instances will be initialized automatically,
 *  during the sl_system_init() call in main.c.
 *****************************************************************************/
sl_status_t led_7seg_init(void)
{
  sl_status_t sc;

  CMU_ClockEnable(cmuClock_GPIO, true);

  /* Setup GPIOs */
  /* Configure ENABLE pin as an output and drive inactive high to turn ON display */
  GPIO_PinModeSet(LED_7SEG_ENABLE_GPIO_PORT, LED_7SEG_ENABLE_GPIO_PIN, gpioModePushPull, 1);
  /* display number 0 */
  sc = led_7seg_display_number(0);
  return sc;
}

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
sl_status_t led_7seg_display_number(uint8_t number)
{
  Ecode_t ret;
  uint8_t right_number;
  uint8_t left_number;
  uint8_t data_buf[2];

  number %= 100;

  left_number = number / 10;
  right_number = number % 10;

  if (left_number == 0) {
    data_buf[0] = number_array[right_number];
    data_buf[1] = number_array[0];
  }
  else {
    data_buf[0] = number_array[right_number];
    data_buf[1] = number_array[left_number];
  }

  /* Send a block transfer to slave. */
  ret = SPIDRV_MTransmitB(spi_handle, data_buf, 2);
  if (ret != ECODE_EMDRV_SPIDRV_OK) {
    return SL_STATUS_FAIL;
  }

  /* Note that at this point all the data is loaded into the fifo, this does
   * not necessarily mean that the transfer is complete. */
  return SL_STATUS_OK;
}

/***************************************************************************//**
 * @brief
 *   Turn on display.
 *
 *****************************************************************************/
void led_7seg_display_on(void)
{
  GPIO_PinOutSet(LED_7SEG_ENABLE_GPIO_PORT, LED_7SEG_ENABLE_GPIO_PIN);
}

/***************************************************************************//**
 * @brief
 *   Turn off display.
 *
 *****************************************************************************/
void led_7seg_display_off(void)
{
  GPIO_PinOutClear(LED_7SEG_ENABLE_GPIO_PORT, LED_7SEG_ENABLE_GPIO_PIN);
}
