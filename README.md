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
```
***********************************
***** ADB: 192.168.1.$IP:5555 *****
***** SSH: 192.168.1.$IP:8022 *****
***********************************
```
*(Note: The IP address will be your device's local IP. Output appears directly in the widget or terminal.)*

A toast notification will also appear with the info:  
`ADB: 192.168.1.$IP:5555 | SSH: 192.168.1.$IP:8022`

---

## Screenshots

![Termux ADB/SSH Info Widget Screenshot 1](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/raw/main/adb-ssh-wifi-program.png)

![Termux ADB/SSH Info Widget Screenshot 2](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/raw/main/adb-ssh-wifi-program2.png)

---

## Requirements
[<img src="assets/izzy_on_droid.png" alt="Get it on IzzyOnDroid" height="70">](https://apt.izzysoft.de/fdroid/index/apk/com.gardockt.termuxterminalwidget)
[<img src="assets/codeberg.svg" alt="Get it on Codeberg" height="70">](https://codeberg.org/gardockt/termux-terminal-widget/releases)
- [Termux](https://f-droid.org/packages/com.termux/) app on Android.
- [Termux Terminal Widget (by gardockt)](https://github.com/gardockt/TermuxTerminalWidget)  
  &nbsp;&nbsp;Package: `com.gardockt.termuxterminalwidget`  
  &nbsp;&nbsp;[Direct APK (IzzySoft repo)](https://apt.izzysoft.de/fdroid/index/apk/com.gardockt.termuxterminalwidget)  
  &nbsp;&nbsp;Available on [Neo Store](https://neostore.io/) or your preferred FOSS app repo.
- Root access (required to enable ADB over Wi-Fi).
- SSH server configured in Termux:  
  ```sh
  pkg install openssh
  ```
Download and Install Gardockt's Termux Terminal Widget (One-liner)
To always get the latest version, run this in Termux:

```
url="https://github.com/gardockt/termux-terminal-widget/releases/latest/download/termux-terminal-widget.apk"
out="termux-terminal-widget.apk"
wget -O "$out" -q --show-progress "$url" && pm install -r "$out" && rm "$out"
```

Or as a one-liner:
```
wget -O ttwidget.apk -q --show-progress "https://github.com/gardockt/termux-terminal-widget/releases/latest/download/termux-terminal-widget.apk" && pm install -r ttwidget.apk && rm ttwidget.apk
```



**Requirements:**

Make sure you have **Termux**, the Termux Terminal Widget addon, root access (for ADB), and an SSH server installed and configured.
You’ll also need a widget script from this GitHub repo to power your first self-made widget!
Either git clone this repo, use wget -v to download the scripts in Termux, or copy and paste any of the short widget scripts into your notepad of choice before copying them into the edit box in the widget setup screen.

**Usage**

Add the Script:
Save your script (for example, display-info.sh) in your ~/.shortcuts/ directory:
```
mv -v display-info.sh ~/.shortcuts/
```
Make the Script Executable:
```
chmod +x ~/.shortcuts/display-info.sh
```
Add the Widget to Your Home Screen:

Long-press an empty area of your Android home screen.

**Tap Widgets.**

Find Termux Widget (green icon) and drag it to your home screen.

**Select Your Script:**

After placing the widget, tap it to bring up a list of available scripts in ~/.shortcuts/.

Select display-info.sh (or your script name).

**Run the Widget:**

Tap the widget on your home screen anytime to instantly see your device’s ADB and SSH connection info, both on-screen and as a toast notification.

**Alternative Method:** Copy-Paste via Widget Setup

After dragging the Termux Widget onto your home screen, some launchers let you edit or paste script contents directly during widget setup.

You can copy your desired script to the clipboard, long-press the widget, choose “edit,” and paste the script right into the widget’s code box.

