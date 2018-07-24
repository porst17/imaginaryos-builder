#!/usr/bin/env bash

# grub-install needs a device map file, can be empty
truncate --size 0 "$BUILD_DIR/device.map"

# install grub into the EFI System partition
grub-install \
	--target=x86_64-efi \
	--no-floppy \
	--removable \
	--grub-mkdevicemap="$BUILD_DIR/device.map" \
	--modules="part_gpt fat ext2 search_fs_uuid" \
	--efi-directory=$ESP_MNT \
	--boot-directory=$ESP_MNT/boot \
	\
	$DISK_DEV

# Determine serial number of EFI System partition for use as UUID
ESP_UUID=$( blkid --output=export /dev/mapper/loop1p2 | grep "^UUID=" | sed "s/^UUID=//" )

# Write very basic grub.cfg to tell grub where to look for
# non-preloaded modules 
echo "search.fs_uuid $ESP_UUID root
set prefix=($root)/boot/grub
" > $ESP_MNT/EFI/BOOT/grub.cfg
