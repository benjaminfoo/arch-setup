#
# This shell-script can be used to upgrade the system, while keeping the bootloader with another efi-compatible os intact.
#

# fully upgrade the system
sudo pacman -Syu

# Check and edit: /etc/default/grub
# GRUB_DISABLE_OS_PROBER=false
# This will allow the detection of windows compatible os and emit something like: 
# "Found Windows Boot Manager on /dev/nvme0n1p1@/efi/Microsoft/Boot/bootmgfw.efi"

# generate bootloader config
sudo grub-mkconfig -o /boot/grub/grub.cfg
 
# install efi compatible bootloader
sudo grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
