#!/data/data/com.termux/files/usr/bin/sh

su -c 'stop adbd'
su -c "pkill -f sshd"
termux-toast "***ADB over WiFi & SSH Service Stopped***"
