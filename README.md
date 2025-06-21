# Termux-ADB-SSH-StartUp_Connection-Info-Widget

A script for Termux:Widget that displays your device's ADB & SSH connection info.  
It enables ADB over Wi-Fi (root required), starts the SSH server, and shows the local IP and ports in a centered box and as a toast notification. Perfect for quick wireless access to your device from your home screen.

---

## Termux ADB & SSH Connection Info Widget

This is a simple shell script for Termux, designed to be used with the Termux:Widget addon. It enables ADB over Wi-Fi, starts an SSH server, and then displays the device's local IP address and the correct ports for both services.

The output is formatted into a centered box for easy reading directly on your widget screen. It also provides a toast notification for quick access to the connection details.

---

## Features

- Enables ADB over TCP/IP on port 5555 (requires root), avoiding the complex, ever-changing random ports used by newer Android. Port 5555 is the classic ADB Wi-Fi default—easy to remember and makes connecting simple.
- Starts the SSH daemon (sshd).
- Automatically detects the device's `wlan0` IP address.
- Automatically detects the SSH port from `~/.ssh/sshd_config` (defaults to 8022 in Android Termux).
- Displays connection information in a visually appealing, centered box.
- Displays a termux-toast notification with your phone’s current IP address and the ports needed for Wi-Fi shell access.
- Optionally keeps the device awake using `termux-wake-lock` (recommended for stable connections).
- Access your phone’s ADB shell or SSH shell in Termux—even when the screen is off!
- Use the `scrcpy` command-line tool to remotely control and view your phone’s screen over Wi-Fi!

---

## Preview

When run, the script will produce a centered output in your terminal or widget like this:
***********************************
***** ADB: 192.168.1.$IP:5555 *****

***** SSH: 192.168.1.$IP:8022 *****
***********************************


*(Note: The IP address will be your device's local IP. Output appears directly in the widget or terminal.)*

A toast notification will also appear with the info:  
`ADB: 192.168.1.10:5555 | SSH: 192.168.1.10:8022`

---

## Requirements

- [Termux](https://f-droid.org/packages/com.termux/) app on Android.
- [Termux Terminal Widget (by gardockt)](https://github.com/gardockt/TermuxTerminalWidget)  
  &nbsp;&nbsp;Package: `com.gardockt.termuxterminalwidget`  
  &nbsp;&nbsp;[Direct APK (IzzySoft repo)](https://apt.izzysoft.de/fdroid/index/apk/com.gardockt.termuxterminalwidget)  
  &nbsp;&nbsp;Available on [Neo Store](https://neostore.io/) or your preferred FOSS app repo.
- Root access (required to enable ADB over Wi-Fi).
- SSH server configured in Termux:  
  ```sh
  pkg install openssh

Download and Install Gardockt's Termux Terminal Widget (One-liner)
To always get the latest version, run this in Termux:

url="https://github.com/gardockt/termux-terminal-widget/releases/latest/download/termux-terminal-widget.apk"
out="termux-terminal-widget.apk"
wget -O "$out" -q --show-progress "$url" && pm install -r "$out" && rm "$out"

Or as a one-liner:

wget -O ttwidget.apk -q --show-progress "https://github.com/gardockt/termux-terminal-widget/releases/latest/download/termux-terminal-widget.apk" && pm install -r ttwidget.apk && rm ttwidget.apk

Usage
1. Make sure all requirements are met and configured.

2. Place this script (e.g., display-info.sh) in your ~/.shortcuts/ directory.

3. Make the script executable:
   chmod +x ~/.shortcuts/display-info.sh
4. Add a new Termux widget to your home screen.

5. Select the script from the list that appears.

6. Tapping the widget will now run the script and display the connection info.

