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

# Partition disks
# For everyone reading this far: this step is highly dependend of your own system,
# so take a look at the arch-wiki for more information: https://wiki.archlinux.org/title/installation_guide#Partition_the_disks

# Install base-system to mounted drives
pacstrap -K /mnt base linux linux-firmware

# Generate fstab for mounted drives
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the system
arch-chroot /mnt

# End of pre-setup phase reached!
# Look into 10-setup.sh for further instructions



