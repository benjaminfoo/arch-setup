#
# Arch-Setup
# This script should get called while entering arch-chroot for the first time
#

# System-Setup - Time & Localization

## Setup the time-zone
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

## Set the System Clock from the Hardware Clock
hwclock --systohc

## Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8, and execute
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen

## Setup the system-lang
echo "LANG=en_US.UTF-8" > /etc/locale.conf

## Setup the console keyboard layout
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

# Boot Manager
## Boot Manager & Tools
pacman -S "grub efibootmgr dosfstools os-propber mtools"

## Setup EFI-directory
mount --mkdir /dev/nvme0n1p2 /boot/efi

## Install GRUB with EFI support
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

## cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

## Install amd-Microcode and ntfs-3g for mounting the data-partition after rebooting
pacman -S "amd-ucode ntfs-3g"

## Create a new GRUB config:
grub-mkconfig -o /boot/grub/grub.cfg

# Leaving the live system
exit
umount -a
reboot
