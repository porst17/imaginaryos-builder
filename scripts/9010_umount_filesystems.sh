#!/usr/bin/env bash
set -x

# unmount filesystems
umount $ESP_MNT
umount $SYSTEM_MNT
umount $CONFIG_MNT
umount $DATA_MNT
