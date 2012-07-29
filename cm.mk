$(call inherit-product, device/pantech/ef65l/full_ef65l.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, xuefy/vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SKY_IM-A820L BUILD_ID=GRJ90 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=SKY/SKY_IM-A820L/ef65l:2.3.5/GRJ90/S1231152.EF65L_DS1_011:user/release-keys PRIVATE_BUILD_DESC="GRJ90-user"

TARGET_BOOTANIMATION_NAME := vertical-800x1280

PRODUCT_NAME := cm_ef65l
PRODUCT_DEVICE := ef65l
