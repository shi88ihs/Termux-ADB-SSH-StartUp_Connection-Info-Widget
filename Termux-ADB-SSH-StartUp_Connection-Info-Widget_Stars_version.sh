#!/data/data/com.termux/files/usr/bin/sh

su -c 'setprop service.adb.tcp.port 5555'
#su -c 'stop adbd'
su -c 'start adbd'
termux-wake-lock
sshd &

ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f1)
adb_port=5555
[ -f ~/.ssh/sshd_config ] && port=$(grep "^Port " ~/.ssh/sshd_config | head -1 | awk '{print $2}') || port=8022

# 31 chars wide
width=31
star_row=$(printf '%*s' "$width" | tr ' ' '*')
adb_str="*****ADB: $ip:$adb_port*****"
ssh_str="*****SSH: $ip:$port*****"

# center function
center() { local s="$1"; printf "%*s\n" $(((${#s}+$width)/2)) "$s"; }

{
  echo "$star_row"
  echo "$star_row"
  center "$adb_str"
  center "$ssh_str"
  echo "$star_row"
  echo "$star_row"
} | lolcat

termux-toast "ADB: $ip:$adb_port | SSH: $ip:$port"
    
