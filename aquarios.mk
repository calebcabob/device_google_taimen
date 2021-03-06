# Copyright (C) 2017 AquariOS
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Call some device specific files for taimen
$(call inherit-product, device/google/taimen/device.mk)
$(call inherit-product, device/google/taimen/self-extractors/root/proprietary/device-vendor.mk)
$(call inherit-product, vendor/google/taimen/taimen-vendor.mk)

# Build with gapps
$(call inherit-product, vendor/pixelgapps/pixel-gapps.mk)

# Include AmbientSense if it's available
-include vendor/ambientmusic/AmbientMusic.mk

# Audio effects
PRODUCT_COPY_FILES += \
    device/google/taimen/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Main Required Packages
PRODUCT_PACKAGES += \
    CarrierConfig

# Permissions
PRODUCT_PACKAGES += \
    privapp-permissions-google.xml
