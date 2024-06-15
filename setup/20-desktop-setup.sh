#
# Arch-Setup-Script (3/3)
# This script gets called after chrooting into the arch-chroot while being on live media.
#

# Setup the user keyboard at /home/owl/.config/kxkbrc:
echo -e '[Layout]\nLayoutList=de\nUse=true\nVariantList=deadgraveacute' > ~/.config/kxkbrc

