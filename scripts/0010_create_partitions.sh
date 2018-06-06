#!/usr/bin/env bash
set -x

# Create the uninitialized disk image
truncate -s ${DISK_IMG_SIZE_MiB}m $DISK_IMG

# Create the gpt partion table and partitions in $DISK_DEV.
sgdisk \
	-o \
        -a 1024 \
        -n 1::4095 -c 1:"BIOS Boot Partition" -t 1:ef02 \
        -a 4096 \
        -n 2::+${ESP_SIZE_MiB}M -c 2:"EFI System Partition" -t 2:ef00 -A 2:set:2 \
        -n 3::+${SYSTEM_SIZE_MiB}M -c 3:"System Partition" -t 3:8300 \
        -n 4::+${CONFIG_SIZE_MiB}M -c 4:"Configuration Partition" -t 4:0700 \
        -n 5::+${DATA_SIZE_MiB}M -c 5:"Data Partition" -t 5:8300 \
        -p $DISK_IMG
