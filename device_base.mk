#
# Copyright (C) 2008 The Android Open-Source Project
# Copyright (C) 2013 OmniROM Project
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

# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
COMMON_ROOTDIR := device/samsung/p1-common/rootdir
DEVICE_PACKAGE_OVERLAYS := device/samsung/p1-common/overlay

# Screen size is large 7"
PRODUCT_AAPT_CONFIG := large mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# These are the hardware-specific configuration files
PRODUCT_COPY_FILES += \
    $(COMMON_ROOTDIR)/init.p1-common.rc:root/init.p1-common.rc \
    $(COMMON_ROOTDIR)/init.trace.rc:root/init.trace.rc \
    $(COMMON_ROOTDIR)/updater.sh:updater.sh \
    $(COMMON_ROOTDIR)/bml_over_mtd.sh:bml_over_mtd.sh \
    $(COMMON_ROOTDIR)/system/bin/set-macaddr:system/bin/set-macaddr \
    $(COMMON_ROOTDIR)/setupdatadata.sh:root/sbin/setupdatadata.sh \
    $(COMMON_ROOTDIR)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(COMMON_ROOTDIR)/system/etc/audio_effects.conf:system/etc/audio_effects.conf \
    $(COMMON_ROOTDIR)/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Prebuilt kl keymaps
PRODUCT_COPY_FILES += \
    $(COMMON_ROOTDIR)/system/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    $(COMMON_ROOTDIR)/system/usr/keylayout/p1_keyboard.kl:system/usr/keylayout/p1_keyboard.kl \
    $(COMMON_ROOTDIR)/system/usr/idc/p1_keyboard.idc:system/usr/idc/p1_keyboard.idc \
    $(COMMON_ROOTDIR)/system/usr/keylayout/AT42QT602240_Touchscreen.kl:system/usr/keylayout/AT42QT602240_Touchscreen.kl \
    $(COMMON_ROOTDIR)/system/usr/idc/AT42QT602240_Touchscreen.idc:system/usr/idc/AT42QT602240_Touchscreen.idc

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
    $(COMMON_ROOTDIR)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(COMMON_ROOTDIR)/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# These are the hardware-specific permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:system/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.screen.portrait.xml:system/etc/permissions/android.hardware.screen.portrait.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
#
# Surface
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.hwrotation=90 \
    ro.sf.lcd_density=160

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.legacy-drm=1 \
    persist.sys.NV_FPSLIMIT=60  \
    ro.min.fling_velocity=8000 \
    persist.service.pcsync.enable=0 \
    persist.service.lgospd.enable=0 \
    ro.config.hw_quickpoweron=true \
    windowsmgr.max_events_per_sec=150 \
    debug.performance.tuning=1 \
    pm.sleep_mode=1 \
    debug.kill_allocating_task=0 \
    dalvik.vm.dexopt-flag=o=y,m=y

# Force dex2oat to not use swap file
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    camera2.port.operation_time_ms=5000

# EGL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.hwui.disable_scissor_opt=true \
    ro.zygote.disable_gl_preload=true \
    ro.bq.gpu_to_cpu_unsupported=1 \
    debug.hwui.render_dirty_regions=false

# Enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# Wi-Fi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.ril_class=SamsungExynos3RIL

# Extended JNI checks
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# Low RAM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true \
    ro.sys.fw.bg_apps_limit=16 \
    ro.config.max_starting_bg=10 \
    dalvik.vm.jit.codecachesize=0

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-Xms=8m \
    dalvik.vm.dex2oat-Xmx=96m \
    dalvik.vm.image-dex2oat-Xms=48m \
    dalvik.vm.image-dex2oat-Xmx=48m \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-filter=interpret-only \
    dalvik.vm.image-dex2oat-filter=speed

# Set default property for USB protocol
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.vold.primary_physical=1

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Use high-end graphics to work around notification bug
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.force_highendgfx=true
 
# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs \
    bml_over_mtd

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.s5pc110 \
    audio.usb.default

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.M4V.Encoder \
    libOMX.SEC.AVC.Encoder

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# HAL
PRODUCT_PACKAGES += \
    camera.s5pc110 \
    libs3cjpeg \
    lights.s5pc110 \
    hwcomposer.s5pc110 \
    power.s5pc110 \
    libstagefrighthw \
    libnetcmdiface

# Packages
PRODUCT_PACKAGES += \
    DeviceSettings \
    com.android.future.usb.accessory \
    Snap

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# f2fs
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs \
    fibmap.f2fs

# ART
PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := \
    --compiler-filter=interpret-only

# Virtual machine setup
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

$(call add-product-dex-preopt-module-config,services,--compiler-filter=speed)

# broadcom wlan
$(call inherit-product, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
