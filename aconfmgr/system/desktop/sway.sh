AddPackage swaylock-fancy-git
AddPackage sway
AddPackage foot
AddPackage rofi-wayland

# Arch borked this somehow
AddPackage waybar

CreateLink /etc/systemd/user/graphical-session.target.wants/waybar.service /usr/lib/systemd/user/waybar.service

IgnorePath /var/lib/colord
