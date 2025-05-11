AddPackage sbctl # Secure Boot key manager
AddPackage sbsigntools # Tools to add signatures to EFI binaries and Drivers
AddPackage systemd-ukify # Combine kernel and initrd into a signed Unified Kernel Image

CopyFile /etc/pacman.d/hooks/80-secureboot.hook # Sign systemd-boot images

# Configure all the required UKI stuff
CopyFile /etc/initcpio/post/uki-sbsign 755
CopyFile /etc/kernel/install.conf

# Keep secure boot keys in a safe location
CreateLink /etc/kernel/secure-boot-certificate.pem /persistent/etc/secureboot/keys/PK/PK.pem
CreateLink /etc/kernel/secure-boot-private-key.pem /persistent/etc/secureboot/keys/PK/PK.key
CreateLink /etc/secureboot /persistent/etc/secureboot

IgnorePath /usr/lib/systemd/boot/efi/systemd-bootia32.efi.signed
IgnorePath /usr/lib/systemd/boot/efi/systemd-bootx64.efi.signed

# Manual setup required (sbctl import-keys -d /etc/secureboot/keys)
IgnorePath /var/lib/sbctl
