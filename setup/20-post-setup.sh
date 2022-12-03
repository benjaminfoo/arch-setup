#
# Arch-Setup
# This script should get called AFTER installing arch (after leaving arch-chroot and rebooting for the first time)
#

# Networking and other System Services
## Temporarily reconnect using dhcpcd
dhcpcd 

## Networking
pacman -S networkmanager

### Enable NetworkManager
systemctl enable NetworkManager.service

## System Services
pacman -S acpid dbus avahi cups

## Enable previously installed services
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable cups

# Desktop Environment

## Install nvidia driver
## Hint: Don't use nouvou, it's the gate to the hell
pacman -S nvidia

## Desktop Environment
pacman -S xorg-server xorg-xinit xorg-apps xorg-xkill gdm gnome

## Enable gdm
systemctl enable gdm.service
