#
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := false

# inherit from the proprietary version
-include vendor/huawei/u8100/BoardConfigVendor.mk

# Camera
BOARD_USE_FROYO_LIBCAMERA := true

# ARMv6-compatible processor rev 2 (v6l)
# CPU
TARGET_BOARD_PLATFORM := msm7k
TARGET_ARCH_VARIANT := armv6j
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_ABI := armeabi-v6j

# Target properties
TARGET_BOOTLOADER_BOARD_NAME := u8100
TARGET_OTA_ASSERT_DEVICE := u8100,u8110,u8120,ascend

# Target information
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := false

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# QCOM
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_LIBRPC := true

# GPS
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := u8100

# Browser
JS_ENGINE := v8

# USB mass storage
BOARD_CUSTOM_USB_CONTROLLER := ../../device/huawei/u8100/UsbController.cpp
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/msm_hsusb/gadget/lun"
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

# Sensors
TARGET_USES_OLD_LIBSENSORS_HAL := true

# Recovery
BOARD_HAS_DATADATA := true
BOARD_LDPI_RECOVERY := true

# Audio
BOARD_USES_GENERIC_AUDIO := false
TARGET_PROVIDES_LIBAUDIO := true

# Graphics
TARGET_HARDWARE_3D := false
BOARD_HAS_LIMITED_EGL := true
BOARD_EGL_CFG := device/huawei/u8100/prebuilt/lib/egl/egl.cfg

# WiFI
BOARD_WPA_SUPPLICANT_DRIVER := AWEXT
WIFI_DRIVER_MODULE_PATH     := /system/wifi/ar6000.ko
WIFI_DRIVER_MODULE_NAME     := ar6000

# MISC
WITH_JIT := true
ENABLE_JSC_JIT := true

# Kernel
BOARD_KERNEL_BASE := 0x00200000
BOARD_KERNEL_CMDLINE := mem=211M console=ttyMSM2,115200n8 androidboot.hardware=u8100
BOARD_KERNEL_PAGESIZE := 4096

#cat /proc/mtd
#dev:    size   erasesize  name
#mtd0: 00500000 00020000 "boot"
#mtd1: 00500000 00020000 "recovery"
#mtd2: 00140000 00020000 "misc"
#mtd3: 00060000 00020000 "splash"
#mtd4: 0aa00000 00020000 "system"
#mtd5: 04600000 00020000 "cache"
#mtd6: 0bda0000 00020000 "userdata"
#mtd7: 01400000 00020000 "userdata2"

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00500000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0aa00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0bda0000

# (BOARD_KERNEL_PAGESIZE * 64)
BOARD_FLASH_BLOCK_SIZE := 262144 
