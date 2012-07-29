#
# Copyright (C) 2011 The CyanogenMod Project
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

PRODUCT_LOCALES := zh_CN zh_TW en_US

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/ef65l/ef65l-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/ef65l/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pantech/ef65l/prebuilt/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/pantech/ef65l/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    device/pantech/ef65l/modules/cpaccess.ko:system/lib/modules/cpaccess.ko \
    device/pantech/ef65l/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
    device/pantech/ef65l/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/pantech/ef65l/modules/evbug.ko:system/lib/modules/evbug.ko \
    device/pantech/ef65l/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    device/pantech/ef65l/modules/ksapi.ko:system/lib/modules/ksapi.ko \
    device/pantech/ef65l/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/pantech/ef65l/modules/librasdioif.ko:system/lib/modules/librasdioif.ko \
    device/pantech/ef65l/modules/msm_tsif.ko:system/lib/modules/msm_tsif.ko \
    device/pantech/ef65l/modules/mwlan_aarp.ko:system/lib/modules/mwlan_aarp.ko \
    device/pantech/ef65l/modules/oprofile.ko:system/lib/modules/oprofile.ko \
    device/pantech/ef65l/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    device/pantech/ef65l/modules/qce.ko:system/lib/modules/qce.ko \
    device/pantech/ef65l/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    device/pantech/ef65l/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/pantech/ef65l/modules/tsif_chrdev.ko:system/lib/modules/tsif_chrdev.ko \
    device/pantech/ef65l/modules/wlan.ko:system/lib/modules/wlan.ko

# Ramdisk
PRODUCT_COPY_FILES += \
    device/pantech/ef65l/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/pantech/ef65l/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/pantech/ef65l/ramdisk/block_image.rle:root/block_image.rle \
    device/pantech/ef65l/ramdisk/block_image1.rle:root/block_image1.rle \
    device/pantech/ef65l/ramdisk/block_image2.rle:root/block_image2.rle \
    device/pantech/ef65l/ramdisk/initlogo.rle:root/initlogo.rle \
    device/pantech/ef65l/ramdisk/logo2.rle:root/logo2.rle \
    device/pantech/ef65l/ramdisk/reboot.rle:root/reboot.rle

# BT firmware
PRODUCT_COPY_FILES += \
    device/pantech/ef65l/prebuilt/BCM4330B1_002.001.003.0337.0374.hcd:system/bin/BCM4330B1_002.001.003.0337.0374.hcd

# Vold configuration
PRODUCT_COPY_FILES += \
    device/pantech/ef65l/prebuilt/vold.fstab:system/etc/vold.fstab

# Set default USB interface
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#    persist.sys.usb.config=mass_storage

# common msm8660
$(call inherit-product, device/pantech/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)
