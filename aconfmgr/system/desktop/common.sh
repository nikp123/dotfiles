AddPackage accountsservice
AddPackage colord
AddPackage gnome-keyring
AddPackage gstreamer
AddPackage gst-plugins-base-libs
AddPackage gvfs
AddPackage gvfs-smb
AddPackage light
AddPackage light-debug
AddPackage orc
AddPackage seatd

IgnorePath /etc/light
IgnorePath /var/lib/AccountsService
IgnorePath /var/lib/colord

CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket
