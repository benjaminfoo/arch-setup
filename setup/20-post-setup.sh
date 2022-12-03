#
# Arch-Setup
# This script should get called AFTER installing arch (after leaving arch-chroot and rebooting for the first time)
#

# Networking and other System Services

## Networking
pacman -S networkmanager

### Enable NetworkManager
systemctl enable NetworkManager.service

## System Services
pacman -S acpid dbus avahi cups

## Enable previously installed services
systemctl enable acpid
systemctl enable avahi-daemon
systemctl enable cups.service

## Tools / Optionals
pacman -S man-db man-pages
pacman -S ntfs-3g
pacman -S mc unrar unzip unarj p7zip cabextract

# Desktop Environment

## Install nvidia driver
## Hint: Don't use nouvou, it's the gate to the hell
pacman -S nvidia

## Desktop Environment
pacman -S xorg-server xorg-xinit xorg-apps xorg-xkill gdm gnome

## Enable gdm
systemctl enable gdm.service

## System
pacman -S zsh git nano lynx htop
pacman -S xfce4-terminal menulibre gparted

## Web
pacman -S firefox thunderbird

## Office
pacman -S libreoffice-still aspell

## Theming
pacman -S noto-fonts-extra
pacman -S papirus-icon-theme
pacman -S gtk-engine-murrine gtk-engines 
pacman -S gnome-tweaks

## Android
pacman -S usbutils gvfs-mtp libmtp android-udev mtpfs

## Steam / multilib
### Un-comment the [multilib] block in /etc/pacman.conf
pacman -Sy
pacman -S steam ttf-liberation lib32-nvidia-utils
pacman -S ffmpeg4.4 zenity libnotify

# Install yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install software from aur
yay -S gnome-shell-extension-blur-my-shell

# Spotify, borked at the moment (manually copy the sh512 checksum from mirror into pkgbuild)
# yay -S "spotify"

# Post-Post-Setups
# Retrieve https://github.com/fthx/dashbar and install via extension-manager
# Use pacman -S gnome-browser-connector to install extensions from the store"
