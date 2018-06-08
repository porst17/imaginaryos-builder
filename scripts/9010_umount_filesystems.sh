#!/usr/bin/env bash
set -x

# don't forget to sync!
sync

# unmount filesystems
umount $ESP_MNT
umount $SYSTEM_MNT
umount $CONFIG_MNT
umount $DATA_MNT
