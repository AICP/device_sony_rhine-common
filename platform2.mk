# Copyright 2016 David Viteri <davidteri91@gmail.com>
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

SONY_ROOT := device/sony/rhine-common/rootdir

# ANT+
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml

PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Sensors config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/sec_config:system/etc/sec_config

# WIFI Tethering
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/system/etc/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.bluetooth.opp=true \
    ro.qualcomm.bluetooth.hfp=true \
    ro.qualcomm.bluetooth.hsp=true \
    ro.qualcomm.bluetooth.pbap=true \
    ro.qualcomm.bluetooth.ftp=true \
    ro.qualcomm.bluetooth.map=true \
    ro.qualcomm.bluetooth.nap=true \
    ro.bluetooth.sap=false \
    ro.bluetooth.dun=false \
    ro.bluetooth.hfp.ver=1.7
endif
