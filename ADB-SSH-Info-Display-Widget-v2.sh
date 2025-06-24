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

# Find active ADB ports (may include more than 1 if multiple sockets are listening)
adb_ports=$(su -c 'netstat -tnlp 2>/dev/null' | grep adbd | grep LISTEN | awk '{print $4}' | awk -F: '{print $NF}' | sort -u)

# Format ADB info
if [ -n "$adb_ports" ]; then
  adb_info="ADB:"
  for port in $adb_ports; do
    adb_info="$adb_info $ip:$port"
  done
else
  adb_info="ADB: STOPPED"
fi

# Check SSH port
ssh_port=$(grep "^Port " ~/.ssh/sshd_config 2>/dev/null | head -1 | awk '{print $2}')
[ -z "$ssh_port" ] && ssh_port=8022

# Check SSH status
if pgrep -f "sshd" >/dev/null; then
  ssh_info="SSH: $ip:$ssh_port"
else
  ssh_info="SSH: STOPPED"
fi

# Build output
output=$(
  echo "$star_row"
  echo "$star_row"
  center_star "$adb_info"
  center_star "$ssh_info"
  echo "$star_row"
  echo "$star_row"
)

# Output to widget
echo "$output"
