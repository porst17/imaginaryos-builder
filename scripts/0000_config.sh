#!/usr/bin/env bash
set -x

# Name of the disk image file
export DISK_IMG=$BUILD_DIR/imaginaryos.img

# Size of the whole disk image (in MiB)
export DISK_IMG_SIZE_MiB=$(( 10 * 1024 )) # 10 GiB

# Partition target sizes (in MiB)
export BIOS_GRUB_SIZE_MiB=1
export ESP_SIZE_MiB=128
export SYSTEM_SIZE_MiB=$(( 6 * 1024 ))
export CONFIG_SIZE_MiB=128
export DATA_SIZE=$(( 3 * 1024 ))

# Define mountpoints
export ESP_MNT=/mnt/esp
export SYSTEM_MNT=/mnt/system
export CONFIG_MNT=/mnt/config
export DATA_MNT=/mnt/data
