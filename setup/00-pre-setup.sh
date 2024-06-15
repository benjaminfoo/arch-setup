#
# Arch-Setup-Script (1/3)
# This script setups up the system before entering arch-chroot
#

# Changing the keyboard to de
loadkeys de-latin1

# Setup ntp, check for correctnes via timedatectl status 
timedatectl set-ntp true

## Check if the current settings support EFI
## if the result is = 64 => uefi
cat /sys/firmware/efi/fw_platform_size

## use lsblk to get an overview of your recognized block devices
# lsblk

## use cfdisk to properly partition your drives
# cfdisk /dev/sda
# EFI-Partition:	cfdisk /dev/sda1 => New => 512M => Type => EFI System => Enter
# Swap:			cfdisk /dev/sda2 => New =>  32G => Type => Linux FileSystem => Enter 
# Regular root:		cfdisk /dev/sda3 => New =>  <leftover> G => Type => Linux Swap => Enter

## format partitions
# format boot partition
mkfs.fat -F32 /dev/sda1

# format swap partition
mkswap /dev/sda2

# format root directorz
mkfs.ext4 /dev/sda3

## mount partitions
# mount root
mount --mkdir /dev/sda3 /mnt/

# mount boot
mount --mkdir /dev/sda1 /mnt/boot

# mount swap
swapon /dev/sda2

## generate /etc/fstab
genfstab -U /mnt > /mnt/etc/fstab

## Install base-system (linux kernel, firmware, etc) to mounted drives
pacstrap /mnt base base-devel linux linux-firmware dhcpcd nano arch-install-scripts ntfs-3g

# Chroot into the system
arch-chroot /mnt

# Continue with the system- and user-setup
# ./10-setup.sh
