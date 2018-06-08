#!/usr/bin/env bash

# Create loopback device for the whole disk
DISK_DEV=$( losetup -f $DISK_IMG --show )
DISK_DEV_NAME=$( lsblk --noheadings --output=NAME $DISK_DEV)

# Create loopback devices for each partition
kpartx -a $DISK_DEV

# Exports for other scripts
export DISK_DEV
export BIOS_BOOT_DEV=/dev/mapper/${DISK_DEV_NAME}p${BIOS_BOOT_PART_NR}
export ESP_DEV=/dev/mapper/${DISK_DEV_NAME}p${ESP_PART_NR}
export SYSTEM_DEV=/dev/mapper/${DISK_DEV_NAME}p${SYSTEM_PART_NR}
export CONFIG_DEV=/dev/mapper/${DISK_DEV_NAME}p${CONFIG_PART_NR}
export DATA_DEV=/dev/mapper/${DISK_DEV_NAME}p${DATA_PART_NR}
