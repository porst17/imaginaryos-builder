#!/usr/bin/env bash
set -x

# Create the uninitialized disk image
truncate -s ${DISK_IMG_SIZE_MiB}m $DISK_IMG

# Create the gpt partion table and partitions in $DISK_DEV.
sgdisk \
	-o \
        -a 1024 \
        -n $BIOS_BOOT_PART_NR::4095 -c $BIOS_BOOT_PART_NR:"BIOS Boot Partition" -t $BIOS_BOOT_PART_NR:ef02 \
        -a 4096 \
        -n $ESP_PART_NR::+${ESP_SIZE_MiB}M -c $ESP_PART_NR:"EFI System Partition" -t $ESP_PART_NR:ef00 -A $ESP_PART_NR:set:2 \
        -n $SYSTEM_PART_NR::+${SYSTEM_SIZE_MiB}M -c $SYSTEM_PART_NR:"System Partition" -t $SYSTEM_PART_NR:8300 \
        -n $CONFIG_PART_NR::+${CONFIG_SIZE_MiB}M -c $CONFIG_PART_NR:"Configuration Partition" -t $CONFIG_PART_NR:0700 \
        -n $DATA_PART_NR::+${DATA_SIZE_MiB}M -c $DATA_PART_NR:"Data Partition" -t $DATA_PART_NR:8300 \
        -p $DISK_IMG
