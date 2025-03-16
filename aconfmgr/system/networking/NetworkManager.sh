AddPackage networkmanager # Network connection manager and user applications

CreateLink /etc/NetworkManager/system-connections /persistent/etc/NetworkManager/system-connections

CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service

# We don't really need to save state files, MAC information and known BSSIDs
IgnorePath /var/lib/NetworkManager
