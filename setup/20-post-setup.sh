#
# Arch-Setup
#
# This script should get called AFTER installing arch (after leaving arch-chroot and rebooting for the first time)
#

# Install software from repos

## System
pacman -S "zsh git nano lynx"

## Web
pacman -S "firefox thunderbird"

## Theming
pacman -S "gtk-engine-murrine gtk-engines gnome-tweaks papirus-icon-theme"

# Install yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install software from aur
yay -S "gnome-shell-extension-blur-my-shell"

# Spotify, borked at the moment (manually copy the sh512 checksum from mirror into pkgbuild)
# yay -S "spotify"
