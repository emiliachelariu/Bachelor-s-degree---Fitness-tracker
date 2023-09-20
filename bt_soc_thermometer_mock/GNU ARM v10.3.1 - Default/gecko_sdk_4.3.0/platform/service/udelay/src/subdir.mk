################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3/platform/service/udelay/src/sl_udelay.c 

S_UPPER_SRCS += \
C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3/platform/service/udelay/src/sl_udelay_armv6m_gcc.S 

OBJS += \
./gecko_sdk_4.3.0/platform/service/udelay/src/sl_udelay.o \
./gecko_sdk_4.3.0/platform/service/udelay/src/sl_udelay_armv6m_gcc.o 

C_DEPS += \
./gecko_sdk_4.3.0/platform/service/udelay/src/sl_udelay.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_4.3.0/platform/service/udelay/src/sl_udelay.o: C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3/platform/service/udelay/src/sl_udelay.c gecko_sdk_4.3.0/platform/service/udelay/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=c99 '-DBGM220PC22HNA=1' '-DSL_APP_PROPERTIES=1' '-DBOOTLOADER_APPLOADER=1' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_2400=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1' '-DSL_BOARD_NAME="BRD4314A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' '-DSLI_RADIOAES_REQUIRES_MASKING=1' -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock\config" -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock\config\btconf" -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/Device/SiliconLabs/BGM22/Include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/common/util/app_assert" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/common/util/app_log" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/common/util/app_timer" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//protocol/bluetooth/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/common/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//protocol/bluetooth/bgstack/ll/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//hardware/board/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/bootloader" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/bootloader/api" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/driver/button/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/cli/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/cli/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/CMSIS/Core/Include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//hardware/driver/configuration_over_swo/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_cryptoacc_library/include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_cryptoacc_library/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/driver/debug/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/device_init/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/dmadrv/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/common/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emlib/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/fem_util" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/gatt_service_device_information" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/gpiointerrupt/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/health_thermometer" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/driver/i2cspm/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/in_place_ota_dfu" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/iostream/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_mbedtls_support/config" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_mbedtls_support/config/preset" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_mbedtls_support/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/mbedtls/include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/mbedtls/library" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/mpu/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/nvm3/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/power_manager/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/printf" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/printf/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_psa_driver/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/common" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/ble" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/ieee802154" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/wmbus" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/zwave" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/chip/efr32/efr32xg2x" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/pa-conversions" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/pa-conversions/efr32xg22" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/rail_util_power_manager_init" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/rail_util_pti" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/se_manager/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/se_manager/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/sensor_rht" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/silicon_labs/silabs_core/memory_manager" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/common/toolchain/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/system/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/sleeptimer/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_protocol_crypto/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/tempdrv/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/udelay/inc" -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock\autogen" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mcmse -fno-builtin-printf -fno-builtin-sprintf --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_4.3.0/platform/service/udelay/src/sl_udelay.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

gecko_sdk_4.3.0/platform/service/udelay/src/sl_udelay_armv6m_gcc.o: C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3/platform/service/udelay/src/sl_udelay_armv6m_gcc.S gecko_sdk_4.3.0/platform/service/udelay/src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM Assembler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m33 -mthumb -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock\config" -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock\config\btconf" -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/Device/SiliconLabs/BGM22/Include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/common/util/app_assert" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/common/util/app_log" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/common/util/app_timer" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//protocol/bluetooth/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/common/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//protocol/bluetooth/bgstack/ll/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//hardware/board/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/bootloader" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/bootloader/api" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/driver/button/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/cli/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/cli/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/CMSIS/Core/Include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//hardware/driver/configuration_over_swo/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_cryptoacc_library/include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_cryptoacc_library/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/driver/debug/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/device_init/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/dmadrv/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/common/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emlib/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/fem_util" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/gatt_service_device_information" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/gpiointerrupt/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/health_thermometer" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/driver/i2cspm/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/in_place_ota_dfu" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/iostream/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_mbedtls_support/config" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_mbedtls_support/config/preset" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_mbedtls_support/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/mbedtls/include" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/mbedtls/library" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/mpu/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/nvm3/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/power_manager/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/printf" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/third_party/printf/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_psa_driver/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/common" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/ble" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/ieee802154" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/wmbus" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/protocol/zwave" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/chip/efr32/efr32xg2x" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/pa-conversions" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/pa-conversions/efr32xg22" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/rail_util_power_manager_init" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/radio/rail_lib/plugin/rail_util_pti" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/se_manager/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/se_manager/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//app/bluetooth/common/sensor_rht" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//util/silicon_labs/silabs_core/memory_manager" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/common/toolchain/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/system/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/sleeptimer/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/security/sl_component/sl_protocol_crypto/src" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/emdrv/tempdrv/inc" -I"C:/Users/unieuro/Downloads/gecko_sdk-gsdk_4.3/gecko_sdk-gsdk_4.3//platform/service/udelay/inc" -I"C:\Users\unieuro\SimplicityStudio\v5_workspace\bt_soc_thermometer_mock\autogen" '-DBGM220PC22HNA=1' '-DSL_APP_PROPERTIES=1' '-DBOOTLOADER_APPLOADER=1' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_2400=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1' '-DSL_BOARD_NAME="BRD4314A"' '-DSL_BOARD_REV="A02"' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=0' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' '-DSLI_RADIOAES_REQUIRES_MASKING=1' -mfpu=fpv5-sp-d16 -mfloat-abi=hard -imacrossl_gcc_preinclude.h -c -x assembler-with-cpp -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


