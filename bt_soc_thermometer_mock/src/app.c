/***************************************************************************//**
 * @file
 * @brief Core application logic.
 *******************************************************************************
 * # License
 * <b>Copyright 2020 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * SPDX-License-Identifier: Zlib
 *
 * The licensor of this software is Silicon Laboratories Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty. In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 *
 ******************************************************************************/
#include <stdbool.h>
#include "em_common.h"
#include "sl_status.h"
#include "sl_simple_button_instances.h"
#include "app_timer.h"
#include "app_log.h"
#include "app_assert.h"
#include "sl_bluetooth.h"
#ifdef SL_COMPONENT_CATALOG_PRESENT
#include "sl_component_catalog.h"
#endif // SL_COMPONENT_CATALOG_PRESENT
#ifdef SL_CATALOG_CLI_PRESENT
#include "sl_cli.h"
#endif // SL_CATALOG_CLI_PRESENT
#include "sl_sensor_rht.h"
#include "sl_health_thermometer.h"
#include "app.h"
#include "sl_i2cspm_instances.h"
#include "gatt_db.h"
#include<math.h>
// Connection handle.
static uint8_t app_connection = 0;

// The advertising set handle allocated from Bluetooth stack.
static uint8_t advertising_set_handle = 0xff;

// Periodic timer handle.
static app_timer_t app_periodic_timer1;
static app_timer_t app_periodic_timer2;
 uint8_t cnt=0,done=0;
uint32_t medie=0,dev=0,suma=0;
uint16_t dataAccY[100]={0};
uint8_t buf[2]={0};
uint32_t accX=0,accY=0,accZ=0,giroX=0,giroY=0,giroZ=0;

// Periodic timer callback.
static void app_periodic_timer_cb_A(app_timer_t *timer, void *data);
static void app_periodic_timer_cb(app_timer_t *timer, void *data);
/**************************************************************************//**
 * Application Init.
 *****************************************************************************/
SL_WEAK void app_init(void)
{
  sl_status_t sc;
  app_log_info("health thermometer initialised\n");
  // Init temperature sensor.
  sc = sl_sensor_rht_init();
  if (sc != SL_STATUS_OK) {
    app_log_warning("Relative Humidity and Temperature sensor initialization failed.");
    app_log_nl();
  }
}

#ifndef SL_CATALOG_KERNEL_PRESENT
/**************************************************************************//**
 * Application Process Action.
 *****************************************************************************/
SL_WEAK void app_process_action(void)
{
  /////////////////////////////////////////////////////////////////////////////
  // Put your additional application code here!                              //
  // This is called infinitely.                                              //
  // Do not call blocking functions from here!                               //
  /////////////////////////////////////////////////////////////////////////////
}
#endif

/**************************************************************************//**
 * Bluetooth stack event handler.
 * This overrides the dummy weak implementation.
 *
 * @param[in] evt Event coming from the Bluetooth stack.
 *****************************************************************************/
void sl_bt_on_event(sl_bt_msg_t *evt)
{
  sl_status_t sc;
  bd_addr address;
  uint8_t address_type;

  // Handle stack events
  switch (SL_BT_MSG_ID(evt->header)) {
    // -------------------------------
    // This event indicates the device has started and the radio is ready.
    // Do not call any stack command before receiving this boot event!
    case sl_bt_evt_system_boot_id:
      // Print boot message.
      app_log_info("Bluetooth stack booted: v%d.%d.%d-b%d\n",
                   evt->data.evt_system_boot.major,
                   evt->data.evt_system_boot.minor,
                   evt->data.evt_system_boot.patch,
                   evt->data.evt_system_boot.build);

      // Extract unique ID from BT Address.
      sc = sl_bt_system_get_identity_address(&address, &address_type);
      app_assert_status(sc);

      app_log_info("Bluetooth %s address: %02X:%02X:%02X:%02X:%02X:%02X\n",
                   address_type ? "static random" : "public device",
                   address.addr[5],
                   address.addr[4],
                   address.addr[3],
                   address.addr[2],
                   address.addr[1],
                   address.addr[0]);

      // Create an advertising set.
      sc = sl_bt_advertiser_create_set(&advertising_set_handle);
      app_assert_status(sc);

      // Generate data for advertising
      sc = sl_bt_legacy_advertiser_generate_data(advertising_set_handle,
                                                 sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      // Set advertising interval to 100ms.
      sc = sl_bt_advertiser_set_timing(
        advertising_set_handle, // advertising set handle
        160, // min. adv. interval (milliseconds * 1.6)
        160, // max. adv. interval (milliseconds * 1.6)
        0,   // adv. duration
        0);  // max. num. adv. events
      app_assert_status(sc);

      // Start advertising and enable connections.
      sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                         sl_bt_advertiser_connectable_scannable);
      app_assert_status(sc);

      app_log_info("Started advertising\n");
      break;

    // -------------------------------
    // This event indicates that a new connection was opened.
    case sl_bt_evt_connection_opened_id:
      app_log_info("Connection opened\n");

#ifdef SL_CATALOG_BLUETOOTH_FEATURE_POWER_CONTROL_PRESENT
      // Set remote connection power reporting - needed for Power Control
      sc = sl_bt_connection_set_remote_power_reporting(
        evt->data.evt_connection_opened.connection,
        sl_bt_connection_power_reporting_enable);
      app_assert_status(sc);
#endif // SL_CATALOG_BLUETOOTH_FEATURE_POWER_CONTROL_PRESENT

      break;

    // -------------------------------
    // This event indicates that a connection was closed.
    case sl_bt_evt_connection_closed_id:
      app_log_info("Connection closed\n");

      // Generate data for advertising
      sc = sl_bt_legacy_advertiser_generate_data(advertising_set_handle,
                                                 sl_bt_advertiser_general_discoverable);
      app_assert_status(sc);

      // Restart advertising after client has disconnected.
      sc = sl_bt_legacy_advertiser_start(advertising_set_handle,
                                         sl_bt_advertiser_connectable_scannable);
      app_assert_status(sc);
      app_log_info("Started advertising\n");
      break;

    ///////////////////////////////////////////////////////////////////////////
    // Add additional event handlers here as your application requires!      //
    ///////////////////////////////////////////////////////////////////////////

    // -------------------------------
    // Default event handler.
    default:
      break;
  }
}

/**************************************************************************//**
 * Callback function of connection close event.
 *
 * @param[in] reason Unused parameter required by the health_thermometer component
 * @param[in] connection Unused parameter required by the health_thermometer component
 *****************************************************************************/
void sl_bt_connection_closed_cb(uint16_t reason, uint8_t connection)
{

  (void)reason;
  (void)connection;
  sl_status_t sc1;
  sl_status_t sc2;
  // Stop timer.
  sc1 = app_timer_stop(&app_periodic_timer1);
  sc2 = app_timer_stop(&app_periodic_timer2);
  app_assert_status(sc1);
  app_assert_status(sc2);
}

/**************************************************************************//**
 * Health Thermometer - Temperature Measurement
 * Indication changed callback
 *
 * Called when indication of temperature measurement is enabled/disabled by
 * the client.
 *****************************************************************************/
void sl_bt_ht_temperature_measurement_indication_changed_cb(uint8_t connection,
                                                            sl_bt_gatt_client_config_flag_t client_config)
{
  sl_status_t sc1;
  sl_status_t sc2;
  app_connection = connection;
  // Indication or notification enabled.
  if (sl_bt_gatt_disable != client_config) {
    // Start timer used for periodic indications.



    sc2 = app_timer_start(&app_periodic_timer2,
                            SL_BT_HT_MEASUREMENT_INTERVAL_SEC * 1000,
                            app_periodic_timer_cb,
                            NULL,
                            true);
    sc1 = app_timer_start(&app_periodic_timer1,
                         SL_BT_HT_MEASUREMENT_INTERVAL_SEC * 10,
                         app_periodic_timer_cb_A,
                         NULL,
                         true);
    app_assert_status(sc1);

      app_assert_status(sc2);


    // Send first indication.
app_periodic_timer_cb(&app_periodic_timer2, NULL);

app_periodic_timer_cb_A(&app_periodic_timer1, NULL);

  }
  // Indications disabled.
  else {
    // Stop timer used for periodic indications.
    (void)app_timer_stop(&app_periodic_timer1);
    (void)app_timer_stop(&app_periodic_timer2);
  }
}

/**************************************************************************//**
 * Timer callback
 * Called periodically to time periodic temperature measurements and indications.
 *****************************************************************************/
static void app_periodic_timer_cb_A(app_timer_t *timer, void *data)
{
  (void)data;
  (void)timer;

  int i;
      i=0;
      sl_i2cspm_init_instances();

         uint8_t dataR[14]={0};
         uint8_t dataW[14]={0};
         //int8_t aX,aY,aZ,gX,gY,gZ;

          I2C_TransferSeq_TypeDef seq = {
              .addr = 0x68 << 1,
              .buf = { { dataW, 14 }, { dataR, 14 } },
              .flags = I2C_FLAG_WRITE_READ
          };

          volatile I2C_TransferReturn_TypeDef err;

          dataW[0] = 0x3B;
          seq.buf[0].len = 1;

          seq.buf[1].len = 14;
          err = I2CSPM_Transfer(sl_i2cspm_mikroe, &seq);
          if (err != i2cTransferDone)
           {
             return;
           }
         accX=accX+dataR[i]*256+ dataR[i+1];


          i=i+2;
          accY=accY+dataR[i]*256+ dataR[i+1];

           dataAccY[done]=dataR[i]*256+ dataR[i+1];
          i=i+2;
          accZ=accZ+dataR[i]*256+ dataR[i+1];
          i=8;

          giroX=giroX+dataR[i]*256+ dataR[i+1];
          i=i+2;
          giroY=giroY+dataR[i]*256+ dataR[i+1];
          i=i+2;
          giroZ=giroZ+dataR[i]*256+ dataR[i+1];
          if(done!=100){
        done++;
          }
    //app_log("%d ",done);
    //app_log( "%x  ",dataR[2]*256+ dataR[3]);
    //app_log( "aX:%d  || aY:%d || aZ:%d || gX:%d || gY:%d ||  gZ:%d    ",accX,accY,accZ,giroX ,giroY,giroZ);
         // app_log("\n");


}
static void app_periodic_timer_cb(app_timer_t *timer, void *data)
{
  (void)data;
   (void)timer;
   sl_status_t sc;
   int j;
   buf[0]=cnt;
   uint32_t localaccY; //copie suma
   uint16_t localdataAccY[100]; //copie valori

   //app_log("%d ",done);

  if(done==100)
      {
      localaccY=accY;
      accX=0,accY=0,accZ=0,giroX=0,giroY=0,giroZ=0;

      for(j=0;j<done;j++){
          localdataAccY[j]=dataAccY[j];
                dataAccY[j]=0;
             }
        //medie=( accX+accY+accZ+giroX+giroY+giroZ)/nr;

        medie=localaccY/done;
        //dev=sqrt((pow((accX-medie),2)+pow((accY-medie),2)+pow((accZ-medie),2)+pow((giroX-medie),2)+pow((giroZ-medie),2))/nr);
        for(j=0;j<done;j++){
              int32_t val = ((int32_t)localdataAccY[j]-(int32_t)medie);
              suma=suma+ val*val;
        }
      dev=sqrt(suma/100);
        //app_log("%lu ",localaccY);
        //app_log("%lu ",medie);
        //app_log("%lu ",suma);
        app_log("%lu  ",dev);
        if(dev>(uint32_t)5000 && localaccY >(uint32_t)30220){
            cnt++;

        }
        buf[1]=dev;
        done=0;
        medie=0;
        dev=0;
        suma=0;
        localaccY=0;
        for(j=0;j<done;j++){
            localdataAccY[j]=0;
        }

      }

  sc =sl_bt_gatt_server_send_indication(app_connection, gattdb_temperature_measurement,sizeof(buf),buf);

  if (sc) {
      app_log_warning("Failed to send  indication\n");
    }
}
#ifdef SL_CATALOG_CLI_PRESENT
void hello(sl_cli_command_arg_t *arguments)
{
  (void) arguments;
  bd_addr address;
  uint8_t address_type;
  sl_status_t sc = sl_bt_system_get_identity_address(&address, &address_type);
  app_assert_status(sc);
  app_log_info("Bluetooth %s address: %02X:%02X:%02X:%02X:%02X:%02X\n",
               address_type ? "static random" : "public device",
               address.addr[5],
               address.addr[4],
               address.addr[3],
               address.addr[2],
               address.addr[1],
               address.addr[0]);
}
#endif // SL_CATALOG_CLI_PRESENT
