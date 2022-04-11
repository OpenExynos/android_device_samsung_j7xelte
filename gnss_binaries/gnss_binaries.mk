# Copy GPS libraries and binaries to the target directory
GPS_ROOT := device/samsung/j7xelte/gnss_binaries/release

PRODUCT_COPY_FILES += \
    $(GPS_ROOT)/lib_gnss.so:system/lib/hw/gps.default.so \
    $(GPS_ROOT)/ca.pem:system/etc/ca.pem
