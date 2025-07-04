#!/data/data/com.termux/files/usr/bin/sh

width=29
star_row=$(printf '%*s' "$width" | tr ' ' '*')

center_star() {
  local text="$1"
  local padding=$(( (width - ${#text} - 2) / 2 ))
  local remainder=$(( (width - ${#text} - 2) % 2 ))
  printf "%s %s %s\n" \
    "$(printf '*%.0s' $(seq 1 $padding))" \
    "$text" \
    "$(printf '*%.0s' $(seq 1 $((padding + remainder))))"
}

# Get IP address from wlan0
ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f1)

# Default ports
adb_port=5555
ssh_port=$(grep "^Port " ~/.ssh/sshd_config 2>/dev/null | head -1 | awk '{print $2}')
[ -z "$ssh_port" ] && ssh_port=8022

# Check ADB status
if su -c 'ps | grep -v grep | grep -q adbd'; then
  adb_info="ADB: $ip:$adb_port"
else
  adb_info="ADB: STOPPED"
fi

# Check SSH status
if pgrep -f "sshd" >/dev/null; then
  ssh_info="SSH: $ip:$ssh_port"
else
  ssh_info="SSH: STOPPED"
fi

output=$(
  echo "$star_row"
  echo "$star_row"
  center_star "$adb_info"
  center_star "$ssh_info"
  echo "$star_row"
  echo "$star_row"
)

#echo "$output" > /data/data/com.termux/files/home/status_box.txt
echo "$output"
