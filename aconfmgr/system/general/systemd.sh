CopyFile /etc/vconsole.conf

# Enabling required systemd services
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
CreateLink /etc/systemd/system/multi-user.target.wants/remote-fs.target /usr/lib/systemd/system/remote-fs.target
CreateFile /var/lib/systemd/timers/stamp-mandoc.timer > /dev/null
CreateFile /var/lib/systemd/timers/stamp-shadow.timer > /dev/null

CreateLink /etc/systemd/system/dbus-org.freedesktop.home1.service /usr/lib/systemd/system/systemd-homed.service

CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/multi-user.target.wants/machines.target /usr/lib/systemd/system/machines.target
CreateLink /etc/systemd/system/multi-user.target.wants/remote-cryptsetup.target /usr/lib/systemd/system/remote-cryptsetup.target
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-homed.service /usr/lib/systemd/system/systemd-homed.service
CreateLink /etc/systemd/system/multi-user.target.wants/systemd-networkd.service /usr/lib/systemd/system/systemd-networkd.service
CreateLink /etc/systemd/system/sockets.target.wants/systemd-mountfsd.socket /usr/lib/systemd/system/systemd-mountfsd.socket
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-confext.service /usr/lib/systemd/system/systemd-confext.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-pstore.service /usr/lib/systemd/system/systemd-pstore.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-sysext.service /usr/lib/systemd/system/systemd-sysext.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/systemd-homed.service.wants/systemd-homed-activate.service /usr/lib/systemd/system/systemd-homed-activate.service

# User services
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket

# SystemD files
IgnorePath /etc/.updated
IgnorePath /etc/.pwd.lock
IgnorePath /etc/machine-id
IgnorePath /etc/systemd/system/ctrl-alt-del.target
IgnorePath /var/.updated
CreateLink /var/lib/dbus/machine-id /etc/machine-id
CreateDir /var/lib/libuuid 2775 uuidd uuidd
CreateDir /var/lib/machines 700
IgnorePath /var/lib/portables
IgnorePath /var/lib/private
IgnorePath /var/lib/systemd/backlight
IgnorePath /var/lib/systemd/catalog
IgnorePath /var/lib/systemd/coredump
IgnorePath /var/lib/systemd/ephemeral-trees
IgnorePath /var/lib/systemd/home
IgnorePath /var/lib/systemd/linger
IgnorePath /var/lib/systemd/pstore
IgnorePath /var/lib/systemd/random-seed
IgnorePath /var/lib/systemd/rfkill
IgnorePath /var/lib/systemd/tpm2-srk-public-key.pem
IgnorePath /var/lib/systemd/tpm2-srk-public-key.tpm2b_public
IgnorePath /var/lib/systemd/timesync
CreateLink /var/lib/tpm2-tss/system /persistent/var/lib/tpm2-tss/system
IgnorePath /var/tmp
