#!/usr/bin/env bash
set -x

# Create mountpoints
mkdir -p $ESP_MNT
mkdir -p $SYSTEM_MNT
mkdir -p $CONFIG_MNT
mkdir -p $DATA_MNT

export

# Mount filesystems
mount $DISK_IMG -o,offset=${PART_START[2]},sizelimit=${PART_SIZE[2]} $ESP_MNT
mount $DISK_IMG -o,offset=${PART_START[3]},sizelimit=${PART_SIZE[3]} $SYSTEM_MNT
mount $DISK_IMG -o,offset=${PART_START[4]},sizelimit=${PART_SIZE[4]} $CONFIG_MNT
mount $DISK_IMG -o,offset=${PART_START[5]},sizelimit=${PART_SIZE[5]} $DATA_MNT

# Check what has been mounted recently
mount | tail -n 4

# Exports for other scripts
export DISK_DEV
