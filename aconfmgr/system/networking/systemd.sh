CreateDir /var/lib/systemd/network '' systemd-network systemd-network

CreateLink /etc/systemd/system/network-online.target.wants/systemd-networkd-wait-online.service /usr/lib/systemd/system/systemd-networkd-wait-online.service
CreateLink /etc/systemd/system/sockets.target.wants/systemd-networkd.socket /usr/lib/systemd/system/systemd-networkd.socket
CreateLink /etc/systemd/system/sockets.target.wants/systemd-nsresourced.socket /usr/lib/systemd/system/systemd-nsresourced.socket
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-network-generator.service /usr/lib/systemd/system/systemd-network-generator.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.network1.service /usr/lib/systemd/system/systemd-networkd.service
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service

