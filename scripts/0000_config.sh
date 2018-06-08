#!/usr/bin/env bash
set -x

# Name of the disk image file
export DISK_IMG=$BUILD_DIR/imaginaryos.img

# Size of the whole disk image (in MiB)
export DISK_IMG_SIZE_MiB=$(( 10 * 1024 )) # 10 GiB

# Partition target sizes (in MiB)
export ESP_SIZE_MiB=128
export SYSTEM_SIZE_MiB=$(( 6 * 1024 ))
export CONFIG_SIZE_MiB=128
export DATA_SIZE_MiB=$(( 3 * 1024 ))

# Partition numbers
export BIOS_BOOT_PART_NR=1 # Keep this to 1
export ESP_PART_NR=2
export SYSTEM_PART_NR=3
export CONFIG_PART_NR=4
export DATA_PART_NR=5

# Define mountpoints
export ESP_MNT=/mnt/esp
export SYSTEM_MNT=/mnt/system
export CONFIG_MNT=/mnt/config
export DATA_MNT=/mnt/data
