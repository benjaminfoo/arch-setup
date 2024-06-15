# Arch-Setup

This repository contains two scripts which reduces the needed time to install arch linux to a minimum.

# Configuration

The installation consists of a bare minimum configurationwhich includes:

- a partition setup consisting of root, boot and swap
- uefi boot
- automated network connection (local and external)
- user setup (root + user)
- handpicked kde desktop
- etc.

# Installation
The two following steps are needed to install arch: 

## (1/2) Pre Chroot
This phase sets up the system while using the live system from the installation medium. 
You simply need to get and execute the 00-pre-setup.sh script.

## (2/2) In Chroot
This phase sets up the system after entering the (arch-)chroot environment.
You simply need to get and execute the 10-setup.sh script.

Reboot - you should get greeted by sddm!

## Further information

- https://wiki.archlinux.org/title/installation_guide
