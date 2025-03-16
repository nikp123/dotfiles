CreateLink /etc/systemd/system/sysinit.target.wants/systemd-boot-update.service /usr/lib/systemd/system/systemd-boot-update.service

# Install linux packages
AddPackage linux-firmware # Firmware files for Linux
AddPackage linux-zen # The Linux ZEN kernel and modules
AddPackage linux-zen-headers # Headers and scripts for building modules for the Linux ZEN kernel

IgnorePath /boot

CopyFile /etc/cmdline.d/root.conf

CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux-zen.preset

