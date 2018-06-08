#!/usr/bin/evn bash
set -x

mkfs.vfat -F 32 $ESP_DEV    # -F 32: FAT32
mkfs.ext4 -F $SYSTEM_DEV    # -F: Force
mkfs.vfat -F 32 $CONFIG_DEV # -F 32: FAT32
mkfs.ext4 -F $DATA_DEV      # -F: Force
