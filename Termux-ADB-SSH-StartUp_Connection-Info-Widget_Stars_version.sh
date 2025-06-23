#!/data/data/com.termux/files/usr/bin/sh

##Fits perfectly with smallest req shape in termux widget
width=29
star_row=$(printf '%*s' "$width" | tr ' ' '*')

##Stars padding
center_star() {
  local text="$1"
  local padding=$(( (width - ${#text} - 2) / 2 ))
  local remainder=$(( (width - ${#text} - 2) % 2 ))
  printf "%s %s %s\n" \
    "$(printf '*%.0s' $(seq 1 $padding))" \
    "$text" \
    "$(printf '*%.0s' $(seq 1 $((padding + remainder))))"
}

# Greps IP address from wlan0 and displays it in the widget
ip=$(ip addr show wlan0 | awk '/inet / {print $2}' | cut -d/ -f1)

# Default ports ofr services
adb_port=5555
ssh_port=$(grep "^Port " ~/.ssh/sshd_config 2>/dev/null | head -1 | awk '{print $2}')
[ -z "$ssh_port" ] && ssh_port=8022

# Check ADB status though grepping for active port in background. if not found displays status as stopped.
if su -c 'ps | grep -v grep | grep -q adbd'; then
  adb_info="ADB: $ip:$adb_port"
else
  adb_info="ADB: STOPPED"
fi

# # Check SSH Service status though grepping for active port in background. If not found displays service status as stopped.
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
