CopyFile /etc/systemd/system/fix-thinkpad-throttle-issue.service 0644
CopyFile /usr/local/bin/fix-thinkpad-throttle-issue 0755

CreateLink /etc/systemd/system/multi-user.target.wants/fix-thinkpad-throttle-issue.service /etc/systemd/system/fix-thinkpad-throttle-issue.service

