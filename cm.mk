# CyanogenMod Specific Changes

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Camera
PRODUCT_PACKAGES += \
    Snap

PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false

# Gello
PRODUCT_PACKAGES += \
    Gello

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder.mk)

$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

BOARD_NEEDS_VENDORIMAGE_SYMLINK := true

# Inline kernel building
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/aarch64/aarch64-linux-android-4.9/bin
KERNEL_TOOLCHAIN_PREFIX := aarch64-linux-android-
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := kernel/htc/flounder/arch/arm64/configs/flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
TARGET_PREBUILT_KERNEL := false

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# CM Overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/flounder/overlay-cm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder \
    BUILD_FINGERPRINT=google/volantis/flounder:6.0.1/MOB30W/3031100:user/release-keys \
    PRIVATE_BUILD_DESC="volantis-user 6.0.1 MOB30W 3031100 release-keys" \
    BUILD_ID=MOB30W

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
