AddPackage gnome-keyring
AddPackage seahorse

# Enable gnome-keyring
CreateLink /etc/systemd/user/sockets.target.wants/gnome-keyring-daemon.socket /usr/lib/systemd/user/gnome-keyring-daemon.socket

# Enable the missing SSH agent
CreateLink /etc/systemd/user/default.target.wants/gcr-ssh-agent.service /usr/lib/systemd/user/gcr-ssh-agent.service
CreateLink /etc/systemd/user/sockets.target.wants/gcr-ssh-agent.socket /usr/lib/systemd/user/gcr-ssh-agent.socket
