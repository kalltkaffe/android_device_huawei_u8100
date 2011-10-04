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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8100/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := huawei_u8100
PRODUCT_DEVICE := u8100
PRODUCT_MODEL := Huawei U8100

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/huawei/u8100/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_PACKAGES += \
    librs_jni \
    libOmxCore \
    libOmxVidEnc \
    gps.u8100 \
    copybit.u8100 \
    lights.msm7k \
#    abtfilt \
    rzscontrol \
    U8100Parts

# Gallery 2D
PRODUCT_PACKAGES += Gallery

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers

# Live Wallpapers support
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Hardware permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Init files
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/init.u8100.rc:root/init.u8100.rc \
    device/huawei/u8100/prebuilt/ueventd.u8100.rc:root/ueventd.u8100.rc

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/huawei/u8100/prebuilt/ramzswap.ko:system/lib/modules/2.6.32.9-perf/ramzswap.ko \
    device/huawei/u8100/prebuilt/tun.ko:system/lib/modules/2.6.32.9-perf/tun.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/huawei/u8100/firmware/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin \
    device/huawei/u8100/firmware/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/huawei/u8100/firmware/caldata.bin.ar6002:system/wifi/caldata.bin.ar6002 \
    device/huawei/u8100/firmware/caldata.bin.ar6102:system/wifi/caldata.bin.ar6102 \
    device/huawei/u8100/firmware/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/huawei/u8100/firmware/data.patch.hw2_0.bin.ar6002:system/wifi/data.patch.hw2_0.bin.ar6002 \
    device/huawei/u8100/firmware/device.bin:system/wifi/device.bin

# Wi-Fi related
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/u8100/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/huawei/u8100/prebuilt/hostapd:system/bin/hostapd \
    device/huawei/u8100/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf

# RIL specific
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/qmuxd:system/bin/qmuxd \
    vendor/huawei/u8100/proprietary/rild:system/bin/rild \
    vendor/huawei/u8100/proprietary/libcm.so:system/lib/libcm.so \
    vendor/huawei/u8100/proprietary/libdiag.so:system/lib/libdiag.so \
    vendor/huawei/u8100/proprietary/libdll.so:system/lib/libdll.so \
    vendor/huawei/u8100/proprietary/libdsm.so:system/lib/libdsm.so \
    vendor/huawei/u8100/proprietary/libdss.so:system/lib/libdss.so \
    vendor/huawei/u8100/proprietary/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    vendor/huawei/u8100/proprietary/libgstk_exp.so:system/lib/libgstk_exp.so \
    vendor/huawei/u8100/proprietary/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    vendor/huawei/u8100/proprietary/libnv.so:system/lib/libnv.so \
    vendor/huawei/u8100/proprietary/liboncrpc.so:system/lib/liboncrpc.so \
    vendor/huawei/u8100/proprietary/libpbmlib.so:system/lib/libpbmlib.so \
    vendor/huawei/u8100/proprietary/libqmi.so:system/lib/libqmi.so \
    vendor/huawei/u8100/proprietary/libqueue.so:system/lib/libqueue.so \
    vendor/huawei/u8100/proprietary/libril.so:system/lib/libril.so \
    vendor/huawei/u8100/proprietary/libril.so:obj/lib/libril.so \
    vendor/huawei/u8100/proprietary/libril-qc-1.so:system/lib/libril-qc-1.so \
    vendor/huawei/u8100/proprietary/libril-qcril-hook-oem.so:system/lib/libril-qcril-hook-oem.so \
    vendor/huawei/u8100/proprietary/libwms.so:system/lib/libwms.so \
    vendor/huawei/u8100/proprietary/libwmsts.so:system/lib/libwmsts.so

# OEM RPC
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/modempre:system/bin/modempre \
    vendor/huawei/u8100/proprietary/oem_rpc_svc:system/bin/oem_rpc_svc \
    vendor/huawei/u8100/proprietary/libhwrpc.so:system/lib/libhwrpc.so \
    vendor/huawei/u8100/proprietary/liboem_rapi.so:system/lib/liboem_rapi.so
    
# OMX
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    vendor/huawei/u8100/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/huawei/u8100/proprietary/libomx_aacdec_sharedlibrary.so:system/lib/libomx_aacdec_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_amrdec_sharedlibrary.so:system/lib/libomx_amrdec_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_amrenc_sharedlibrary.so:system/lib/libomx_amrenc_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_avcdec_sharedlibrary.so:system/lib/libomx_avcdec_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_m4vdec_sharedlibrary.so:system/lib/libomx_m4vdec_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_mp3dec_sharedlibrary.so:system/lib/libomx_mp3dec_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_sharedlibrary.so:system/lib/libomx_sharedlibrary.so \
    vendor/huawei/u8100/proprietary/libomx_sharedlibrary_qc.so:system/lib/libomx_sharedlibrary_qc.so \
    vendor/huawei/u8100/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/huawei/u8100/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/huawei/u8100/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/huawei/u8100/proprietary/libOmxWmvDec.so:system/lib/libOmxWmvDec.so

# Hardware drivers
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/gralloc.msm7k.so:system/lib/hw/gralloc.msm7k.so \
    vendor/huawei/u8100/proprietary/sensors.default.so:system/lib/hw/sensors.default.so

# Sensors
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/akmd2:system/bin/akmd2

# Bluetooth
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/hci_qcomm_init:system/bin/hci_qcomm_init \
    vendor/huawei/u8100/proprietary/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Audio
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterU8100.csv:system/etc/AudioFilterU8100.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterU8110.csv:system/etc/AudioFilterU8110.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterU8120.csv:system/etc/AudioFilterU8120.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterU8160.csv:system/etc/AudioFilterU8160.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterU8300.csv:system/etc/AudioFilterU8300.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterC8150.csv:system/etc/AudioFilterC8150.csv \
    device/huawei/u8100/prebuilt/etc/AudioFilterC8600.csv:system/etc/AudioFilterC8600.csv \
    device/huawei/u8100/prebuilt/etc/01_qc.cfg:system/etc/01_qc.cfg \
    vendor/huawei/u8100/proprietary/libaudioeq.so:system/lib/libaudioeq.so

#Media profile
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

# Camera
PRODUCT_COPY_FILES += \
    vendor/huawei/u8100/proprietary/libcamera.so:obj/lib/libcamera.so \
    vendor/huawei/u8100/proprietary/libcamera.so:system/lib/libcamera.so \
    vendor/huawei/u8100/proprietary/libqcamera.so:system/lib/libqcamera.so \
    vendor/huawei/u8100/proprietary/libmmjpeg.so:system/lib/libmmjpeg.so \
    vendor/huawei/u8100/proprietary/libmmipl.so:system/lib/libmmipl.so \
    vendor/huawei/u8100/proprietary/libmmprocess.so:system/lib/libmmprocess.so

# Keylayout
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Other
PRODUCT_COPY_FILES += \
    device/huawei/u8100/prebuilt/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
    device/huawei/u8100/prebuilt/etc/vold.fstab:system/etc/vold.fstab
