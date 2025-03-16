AddPackage arc-gtk-theme
AddPackage numix-icon-theme-pack-git
AddPackage plymouth
AddPackage minecraft-plymouth-theme-git

CopyFile /etc/cmdline.d/pretty.conf
CopyFile /etc/plymouth/plymouthd.conf
IgnorePath /var/lib/plymouth/boot-duration
IgnorePath /usr/share/icons
