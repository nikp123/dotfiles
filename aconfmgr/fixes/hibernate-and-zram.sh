CreateLink /etc/systemd/system/hibernate.target.requires/pre-hibernation.service /etc/systemd/system/pre-hibernation.service
CreateLink /etc/systemd/system/sleep.target.requires/pre-hibernation.service /etc/systemd/system/pre-hibernation.service
CreateLink /etc/systemd/system/systemd-hibernate.service.requires/pre-hibernation.service /etc/systemd/system/pre-hibernation.service
CopyFile /etc/systemd/system/pre-hibernation.service
CopyFile /etc/systemd/system/systemd-logind.service.d/override.conf 755
CopyFile /usr/lib/systemd/system-sleep/zram-hibernate-hook 755
