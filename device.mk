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
## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/pantech/ef65l/ef65l-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/pantech/ef65l/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/pantech/ef65l/prebuilt/zImage
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/pantech/ef65l/modules/mwlan_aarp.ko:system/lib/modules/mwlan_aarp.ko \
    device/pantech/ef65l/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
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
