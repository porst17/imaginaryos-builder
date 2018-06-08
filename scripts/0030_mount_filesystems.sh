#!/usr/bin/env bash
set -x

# Create mountpoints
mkdir -p $ESP_MNT
mkdir -p $SYSTEM_MNT
mkdir -p $CONFIG_MNT
mkdir -p $DATA_MNT

# Mount filesystems
mount $ESP_DEV $ESP_MNT
mount $SYSTEM_DEV $SYSTEM_MNT
mount $CONFIG_DEV $CONFIG_MNT
mount $DATA_DEV $DATA_MNT

# Check what has been mounted recently
mount | tail -n 4
