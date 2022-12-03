#
# Arch-Setup
# This script setups up the system before entering arch-chroot
#
# TODO: 
# - Implement Secure Boot via: https://www.codingblatt.de/arch-linux-installation-luks-lvm-apparmor-secure-boot/
# 

# Changing the keyboard to de
loadkeys de-latin1

# Setup ntp, check for correctnes via timedatectl status 
timedatectl set-ntp true

# Check if the current settings support EFI
ls /sys/firmware/efi/efivars

# Partition disks
# For everyone reading this far: this step is highly dependend of your own system,
# so take a look at the arch-wiki for more information: https://wiki.archlinux.org/title/installation_guide#Partition_the_disks

# use lsblk to get an overview of your recognized block devices
## Hint: Check currently available mounts with mount
## lsblk

# use cfdisk to properly partition your drives
## nvme0n1 = for NVM-Express drives 
## cfdisk /dev/nvme0n1

# EFI-Partition: cfdisk /dev/nvme0n1 => New => 512M => Type => EFI System => Enter
# Regular Root : cfdisk /dev/nvme0n1 => New => 200G => Type => Linux FileSystem => Enter 
# Swap         : cfdisk /dev/nvme0n1 => New =>  32G => Type => Linux Swap => Enter
# Write => yes

## sd* for regular ssds
## cfdisk /dev/sda 
## cfdisk /dev/sdb 

## format partitions
## First one is EFI, second one is /, third one is swap
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkswap /dev/nvme0n1p3    
mkfs.ext4 /dev/sda1

## mount partitions
mount /dev/nvme0n1p2 /mnt/
mount --mkdir /dev/sda1 /mnt/home/
mount --mkdir /dev/sdb1 /mnt/mnt/data
swapon /dev/nvme0n1p3

## generate /etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab

## Install base-system (linux kernel, firmware, etc) to mounted drives
pacstrap /mnt base base-devel linux linux-firmware dhcpcd nano arch-install-scripts ntfs-3g

# Chroot into the system
arch-chroot /mnt

# End of pre-setup phase reached!
# Look into 10-setup.sh for further instructions
