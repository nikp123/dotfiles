AddPackage gdm

CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/gdm.service

IgnorePath /var/lib/gdm
