#
# Arch-Setup
#
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

## System Software
pacman -S "amd-ucode linux-firmware"

## Networking
pacman -S "networkmanager dhcpcd"

### Enable NetworkManager
systemctl enable NetworkManager.service

## Tools / Optionals
pacman -S "man-db man-pages"
pacman -S "ntfs-3g usbutils unrar unzip p7zip"

## Android
pacman -S "gvfs-mtp libmtp android-udev mtpfs"

## Pre-Desktop Environment
pacman -S "nvidia"

## Desktop Environment
pacman -S "xorg-server xorg-apps xorg-xkill gdm gnome"

## Enable gdm
systemctl enable gdm.service
