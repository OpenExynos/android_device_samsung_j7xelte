#
# Copyright (C) 2015 The Android Open-Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/j7xelte/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

include $(LOCAL_PATH)/BoardConfig.mk
# These are for the multi-storage mount.
DEVICE_PACKAGE_OVERLAYS := \
	device/samsung/j7xelte/overlay

# Init files
PRODUCT_COPY_FILES += \
	device/samsung/j7xelte/conf/init.universal7870.rc:root/init.samsungexynos7870.rc \
	device/samsung/j7xelte/conf/init.universal7870.usb.rc:root/init.samsungexynos7870.usb.rc \
	device/samsung/j7xelte/conf/fstab.universal7870:root/fstab.samsungexynos7870 \
	device/samsung/j7xelte/conf/init.carrier.rc:root/init.carrier.rc \
	device/samsung/j7xelte/conf/init.container.rc:root/init.container.rc \
	device/samsung/j7xelte/conf/init.rilchip.rc:root/init.rilchip.rc \
	device/samsung/j7xelte/conf/init.rilcommon.rc:root/init.rilcommon.rc

PRODUCT_COPY_FILES += \
	device/samsung/j7xelte/conf/ueventd.universal7870.rc:root/ueventd.samsungexynos7870.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

# Audio
PRODUCT_PACKAGES += \
	audio.primary.universal7870 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \

PRODUCT_COPY_FILES += \
	device/samsung/j7xelte/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/j7xelte/mixer_paths.xml:system/etc/mixer_paths.xml \
	device/samsung/j7xelte/mixer_paths_rev03.xml:system/etc/mixer_paths_rev03.xml


# Libs
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# for now include gralloc here. should come from hardware/samsung_slsi/exynos5
PRODUCT_PACKAGES += \
	gralloc.exynos5

PRODUCT_PACKAGES += \
	libion

PRODUCT_PACKAGES += \
	libstlport

# RPMB
#PRODUCT_PACKAGES += \
       rpmbd \
       tlrpmb

# Power HAL
PRODUCT_PACKAGES += \
	power.universal7870

# MobiCore setup
#PRODUCT_PACKAGES += \
	libMcClient \
	libMcRegistry \
	libgdmcprov \
	mcDriverDaemon

# WideVine DASH modules
#PRODUCT_PACKAGES += \
	libwvdrmengine

#Gatekeeper
#PRODUCT_PACKAGES += \
       gatekeeper.exynos7870

# WideVine modules
#PRODUCT_PACKAGES += \
	com.google.widevine.software.drm.xml \
	com.google.widevine.software.drm \
	WidevineSamplePlayer \
	libdrmwvmplugin \
	libwvm \
	libWVStreamControlAPI_L1 \
	libwvdrm_L1

# SecureDRM modules
PRODUCT_PACKAGES += \
	secdrv \
#	tlwvdrm \
	tlsecdrm \
	liboemcrypto_modular

# KeyManager/AES modules
PRODUCT_PACKAGES += \
	tlkeyman

# Keymaster
#PRODUCT_PACKAGES += \
	keystore.exynos7870 \
	tlkeymasterM

PRODUCT_PACKAGES += \
	camera.universal7870

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	device/samsung/j7xelte/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/j7xelte/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
	device/samsung/j7xelte/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \

# Copy FIMC-IS-FW
PRODUCT_COPY_FILES += \
       device/samsung/j7xelte/firmware/fimc_is_lib.bin:system/vendor/firmware/fimc_is_lib.bin \
       device/samsung/j7xelte/firmware/setfile_3l2.bin:system/vendor/firmware/setfile_3l2.bin \
       device/samsung/j7xelte/firmware/setfile_5e3.bin:system/vendor/firmware/setfile_5e3.bin

# Camera configuration files
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \

# WLAN configuration
# device specific wpa_supplicant.conf
PRODUCT_COPY_FILES += \
        device/samsung/j7xelte/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Bluetooth configuration
PRODUCT_COPY_FILES += \
       frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
       frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
       hardware/samsung_slsi/libbt/conf/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
       hardware/samsung_slsi/libbt/conf/bt_did.conf:system/etc/bluetooth/bt_did.conf

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=196609 \
	debug.hwc.otf=1 \
	debug.hwc.winupdate=1 \
	debug.hwc.nodirtyregion=1

PRODUCT_PROPERTY_OVERRIDES += \
        wifi.interface=wlan0

# WideVine DRM setup
#PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled = true

# CP Booting daemon
#PRODUCT_PACKAGES += \
	cbd

# Packages needed for WLAN
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    hostapd \
    wpa_supplicant.conf \
    wpa_supplicant

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

PRODUCT_CHARACTERISTICS := phone

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
       device/samsung/j7xelte/conf/init.rc:root/init.rc \

MODEM_USE_ONECHIP := true
MODEM_USE_GPT := true
#MODEM_USE_UFS := true
#MODEM_NOT_USE_FINAL_CMD := true

$(call inherit-product, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product-if-exists, vendor/samsung_slsi/exynos7870/exynos7870-vendor.mk)
$(call inherit-product, hardware/samsung_slsi/exynos7870/exynos7870.mk)
#$(call inherit-product, device/samsung/j7xelte/gnss_binaries/gnss_binaries.mk)
