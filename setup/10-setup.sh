#
# Arch-Setup
# This script should get called while entering arch-chroot for the first time
#

# System-Setup

## Setup the time-zone
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

## Set the System Clock from the Hardware Clock
hwclock --systohc

## localization
### Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8, and execute
locale-gen

### Setup the system-lang
echo "LANG=en_US.UTF-8" > /etc/locale.conf

### Setup the console keyboard layout
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

# System Software

## Networking
pacman -S "networkmanager dhcpcd"

### Enable NetworkManager
systemctl enable NetworkManager.service

## System Services
pacman -S "acpid dbus avahi cups"

## Enable previously installed services
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable cups.service


## Boot Manager
pacman -S "grub efibootmgr dosfstools os-propber mtools linux linux-headers"

## Firmware and Microcode
pacman -S "amd-ucode linux-firmware"
