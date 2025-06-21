#!/data/data/com.termux/files/usr/bin/sh

# --- Start ADB over WiFi only if not already running ---
if ! pgrep -f "adbd" >/dev/null; then
    su -c 'setprop service.adb.tcp.port 5555'
    su -c 'stop adbd'
    su -c 'start adbd'
fi

adb_ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f1)
adb_port=5555

if [ -z "$adb_ip" ]; then
    termux-toast "No WiFi IP found for ADB!"
    echo "Could not find WiFi IP address for ADB. Is WiFi enabled?"
else
    adb_cmd="From PC Run:\nadb connect $adb_ip:$adb_port\nthen Run:\nscrcpy -K   # For Remote CTRL GUI Access"
    termux-toast "***ADB over WiFi: adb connect $adb_ip:$adb_port***"
    echo "$adb_cmd"
fi

echo "--------------------------"

# --- Start SSHD only if not running ---
if ! pgrep -f "sshd" >/dev/null; then
    termux-wake-lock
    sshd &
    sleep 1
fi

ssh_ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f1)
if [ -f ~/.ssh/sshd_config ] && grep -q "^Port " ~/.ssh/sshd_config; then
    ssh_port=$(grep "^Port " ~/.ssh/sshd_config | head -1 | awk '{print $2}')
else
    ssh_port=8022
fi

if [ -z "$ssh_ip" ]; then
    ssh_msg="Could not detect WiFi IP for SSH! (Is WiFi connected?)"
else
    ssh_msg="SSH running on $ssh_ip:$ssh_port"
fi

termux-toast "$ssh_msg"
echo "$ssh_msg"
