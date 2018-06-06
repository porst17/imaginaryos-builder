#!/usr/bin/evn bash
set -x

# Query the sector size of the disk image
DISK_DEV=$( losetup -f $DISK_IMG --show )
DISK_DEV_NAME=$( lsblk --noheadings --output NAME $DISK_DEV )
DISK_SECTOR_SIZE=$( cat /sys/block/$DISK_DEV_NAME/queue/hw_sector_size )
losetup -d $DISK_DEV

# Create filesystems via temporary loopback device
declare -a PART_START PART_SIZE
while IFS=" " read -r NR START SECTORS REMAINDER
do
	PART_START[$NR]=$(( START * DISK_SECTOR_SIZE ))
	PART_SIZE[$NR]=$(( SECTORS * DISK_SECTOR_SIZE ))
	DEV=$( losetup --offset=${PART_START[$NR]} --sizelimit=${PART_SIZE[$NR]} -f $DISK_IMG --show )
	
	case $NR in
	[24])
		mkfs.vfat -F 32 $DEV
		;;
	[35])
		mkfs.ext4 $DEV
		;;
	esac

	losetup -d $DEV
done < <(partx --noheadings --output NR,START,SECTORS $DISK_IMG)

# Exports for other scripts
export PART_START PART_SIZE
