AddPackage lightdm # A lightweight display manager
AddPackage lightdm-slick-greeter

CopyFile /etc/lightdm/lightdm.conf

IgnorePath /var/lib/lightdm
IgnorePath /var/lib/lightdm-data

CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/lightdm.service
