# Arch-Setup
This repository contains a collection of scripts in order to install a minimal, non-optional, uefi-supported arch setup on my workstation.  

The setup is seperated into multiple steps: Pre-Setup -> Setup -> Post-Setup

## Pre-Setup
This phase sets up the system while using the live system from the installation medium.

## Setup
This phase sets up the system after entering the (arch-)chroot environment.

## Post Setup
This phase sets up the system from within the installed arch system on the workstation.

## Requirements
- A bootable installation media with the latest arch iso installed, see: https://wiki.archlinux.org/title/USB_flash_installation_medium
- A working ethernet connection on the target client

## Tips
If you messed up something during the installation and can't boot anymore,  
simply reinsert the live installation medium, mount the root partition and arch-chroot into it.

## Further information
- https://wiki.archlinux.org/title/installation_guide
