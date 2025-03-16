# Install filesystem related packages

AddPackage arch-install-scripts # Scripts to aid in installing Arch Linux
AddPackage btrfs-progs # Btrfs filesystem utilities
AddPackage cryptsetup # Userspace setup tool for transparent encryption of block devices using dm-crypt
AddPackage lvm2 # Logical Volume Manager 2 utilities

CopyFile /etc/fstab

CreateLink /etc/lvm/archive /persistent/etc/lvm/archive
CreateLink /etc/lvm/backup /persistent/etc/lvm/backup

# Save important files into a persistent directory
# but don't manage them inside of your configuration
# as they most likely contain secrets
CreateDir /persistent
# This is to work around a bug that thinks that I'm always recreating this directory
CreateLink /persistent/.i_exist_lmao /dev/null
IgnorePath /persistent/*
