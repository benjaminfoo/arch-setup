#
# Arch-Setup-Script (2/3)
# This script gets called after chrooting into the arch-chroot while being on live media.
#

# TODO
# Make some variables and put them up here for easier configuration and reusing them
# username = benni
# hostname = desktop
# timezone = /usr/share/zoneinfo/Europe/Berlin
# keymap = de-latin1

################
# Base - Setup #
################

# Setup the time-zone
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Set the System Clock from the Hardware Clock
hwclock --systohc

# Set the system locale and generate locales
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "de_DE.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Setup the system-lang
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Setup the console keyboard layout
echo "KEYMAP=de-latin1" > /etc/vconsole.conf

# Setup the hostname
echo desktop > /etc/hostname

# Boot Manager & Tools and amd CPU microcode-updates
pacman -S grub efibootmgr dosfstools os-prober mtools amd-ucode

# Setup EFI-directory
mount --mkdir /dev/sda1 /boot/efi

## Install GRUB with EFI support
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

## do something with locale messages etc.
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

## Create a new GRUB config:
grub-mkconfig -o /boot/grub/grub.cfg

## Setup the root-password
passwd





###################
# Service - Setup #
###################

## Networking
pacman -S networkmanager
systemctl enable NetworkManager.service

## System Services

### Power Management - useful for notebooks
### pacman -S acpid2
### systemctl enable acpid2.service

## Enable network discovery
pacman -S avahi
systemctl enable avahi-daemon

## Enable printer support
pacman -S cups
systemctl enable cups

## Enable timesync and ssd trim services
systemctl enable --now systemd-timesyncd.service
systemctl enable --now fstrim.timer





################
# User - Setup #
################

## Setup the user account
useradd -m -g users -s /bin/bash benni

## Add the user to the sudoers file
echo "benni  ALL=(ALL:ALL) ALL" >> /etc/sudoers

passwd benni



###################
# Desktop - Setup #
###################

# Install nvidia driver - hint: Don't use nouvou, it's the gate to the hell
pacman -S nvidia

## Desktop Environment
pacman -S xorg-server xorg-xinit xorg-apps xorg-xkill sddm plasma

## Enable gdm
systemctl enable sddm.service





##################
# System - Setup #
##################

## Man-Pages
pacman -S man-db man-pages

## Simple dev tools
pacman -S mc git nano lynx htop

## KDE
### Graphics
pacman -S arianna colord-kde gwenview kamera kcolorchooser koko okular spectacle svgpart gimp
pacman -S kimageformats qt6-imageformats kdegraphics-mobipocket

### Multimedia
pacman -S ffmpegthumbs kamoso kmix

### Network
pacman -S kio kio-extras kio-zeroconf

### System
pacman -S dolphin kde-inotify-survey khelpcenter kio-admin kjournald ksystemlog partitionmanager
pacman -S kdegraphics-thumbnailers kdenetwork-filesharing bcachefs-tools exfat-utils

### Utilities
pacman -S ark filelight isoimagewriter kcalc kate kbackup kcharselect kdf kdialog keditbookmarks kfind kgpg konsole
pacman -S arj lrzip lzop p7zip unarchiver unrar mlocate unzip unarj


### KCM
pacman -S sddm-kcm

## Web
pacman -S firefox thunderbird

## Office
pacman -S libreoffice-still aspell

## Android
pacman -S usbutils gvfs-mtp libmtp android-udev mtpfs





##################
# Etc    - Setup #
##################

## Steam / multilib
### Un-comment the [multilib] block in /etc/pacman.conf
# pacman -Sy
# pacman -S steam ttf-liberation lib32-nvidia-utils
# pacman -S ffmpeg4.4 zenity libnotify

# Install yay
# pacman -S --needed git base-devel
# git clone https://aur.archlinux.org/yay.git
# cd yay
# makepkg -si

# Spotify, borked at the moment (manually copy the sh512 checksum from mirror into pkgbuild)
# yay -S "spotify"

# Continue with the desktop-setup
# ./20-desktop-setup.sh
