AddPackage nix

# Paths get fucked if we don't do this
CopyFile /etc/fish/conf.d/nix.fish

# Home Manager depends on this
AddPackage xfconf

CopyFile /etc/nix/nix.conf
CreateLink /etc/systemd/system/multi-user.target.wants/nix-daemon.service /usr/lib/systemd/system/nix-daemon.service

IgnorePath /nix
