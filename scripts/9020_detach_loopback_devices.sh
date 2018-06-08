#!/usr/bin/env bash
set -x

# detach loopback devices of partitions
kpartx -d $DISK_DEV

# detach loopback device of disk image
losetup -d $DISK_DEV
