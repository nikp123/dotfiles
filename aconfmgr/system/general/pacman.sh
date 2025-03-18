AddPackage base # Minimal package set to define a basic Arch Linux installation
AddPackage base-devel # Basic tools to build Arch Linux packages

# Wed Mar 12 15:18:16 CET 2025 - Unknown foreign packages
AddPackage --foreign aconfmgr-git # A configuration manager for Arch Linux
AddPackage --foreign yay-bin # Yet another yogurt. Pacman wrapper and AUR helper written in go. Pre-compiled.
AddPackage --foreign yay-bin-debug # Detached debugging symbols for yay-bin

# Ignore keyfiles
IgnorePath /etc/pacman.d/gnupg

# Ignore mirrorlists
IgnorePath /etc/pacman.d/mirrorlist
IgnorePath /etc/pacman.d/mirrorlist.pacnew

# Pacman's configuration
CopyFile /etc/pacman.conf
CopyFile /etc/makepkg.conf.d/parallel.conf

# Ignore pacman's state files
IgnorePath /var/lib/pacman

# Services
CreateFile /var/lib/systemd/timers/stamp-archlinux-keyring-wkd-sync.timer > /dev/null
