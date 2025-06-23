#!/data/data/com.termux/files/usr/bin/sh

##Set's Android Debug Bridge(ADB) Server to Old, Defualt and easy to remember port 5555
su -c 'setprop service.adb.tcp.port 5555'

##Stops previous Servers if any by running as root and using the stop cmd that stops services. 
su -c 'stop adbd'

##start the ADB Server
su -c 'start adbd'

##Wake Lock Disabled, unuseful battery drain
#termux-wake-lock

##Starts Termux ssh server and put it i the background
sshd &

#Displays Termux Toast. Uncomment if you want termux toasts. I find it screen spam and the info is in the widget anyways, so unneeded.
#termux-toast "ADB: $ip:$adb_port | SSH: $ip:$port"
    
