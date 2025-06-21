# Termux-ADB-SSH-StartUp_Connection-Info-Widget [ROOT-REQUIRED]

![Termux ADB/SSH Info Widget Screenshot 1](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/raw/main/adb-ssh-wifi-program.png)

Finally, a quick and easy way to interact with your Android device using both **ADB** and **SSH** shells—while always staying up to date on your current IP and the ports needed to connect!
No more digging through **Developer Options**, typing in complex port numbers, constantly running **ip r** in Termux, or searching Wi-Fi settings for your current IP address.
All connection info is displayed at boot, and services are launched automatically!

This script for Termux:Widget displays your device’s **ADB** & **SSH** connection info, enables **ADB** over Wi-Fi (root required), starts the **SSH** server, and shows the local IP and ports in a centered box and as a toast notification. Perfect for quick wireless access to your device—right from your home screen.

---

## Features

- Enables ADB over TCP/IP on port 5555 (requires root), avoiding the complex, ever-changing random ports used by newer Android. Port 5555 is the classic ADB Wi-Fi default—easy to remember and makes connecting simple.
- Starts the SSH daemon (sshd).
- Automatically detects the device's `wlan0` IP address.
- Automatically detects the SSH port from `~/.ssh/sshd_config` (defaults to 8022 in Android Termux).
- Displays connection information in a visually appealing, centered box.
- Displays a termux-toast notification with your phone’s current IP address and the ports needed for Wi-Fi shell access.
- Optionally keeps the device awake using `termux-wake-lock` (recommended for stable connections).
- Access your phone’s **ADB** shell or SSH shell in Termux—even when the screen is off!
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

## Requirements
[![Get it on IzzyOnDroid](https://apt.izzysoft.de/fdroid/repo/IzzyOnDroid.png)](https://apt.izzysoft.de/fdroid/index/apk/com.gardockt.termuxterminalwidget)
[![Get it on Codeberg](https://codeberg.org/img/codeberg_badge.svg)](https://codeberg.org/)
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
  **Optional:** Start SSH automatically at boot with Termux:Boot

  **Install the Termux: **Boot app (from F-Droid or your preferred FOSS repo).

  In Termux, set up the boot script:
  ```
  mkdir -p ~/.termux/boot/ && 
  echo -e '#!/data/data/com.termux/files/usr/bin/sh\ntermux-wake-lock\nsshd' > ~/.termux/boot/sshd_start.sh && 
  chmod +x ~/.termux/boot/sshd_start.sh
  ```
  After this, the SSH daemon will start automatically whenever your device boots, and termux-wake-lock will keep the device awake for stable SSH sessions.
  Download and Install **Gardockt's Termux Terminal Widget APK** (One-liner)
  To always get the latest version, run this in **Termux**:

  ```
  url="https://github.com/gardockt/termux-terminal-widget/releases/latest/download/termux-terminal-widget.apk"
  out="termux-terminal-widget.apk"
  wget -O "$out" -q --show-progress "$url" && pm install -r "$out" && rm "$out"
  ```

  Or as a one-liner:
  ```
  wget -O termux-terminal-widget.apk -q --show-progress "https://github.com/gardockt/termux-terminal-widget/releases/latest/download/termux-terminal-widget.apk"
  && pm install -r termux-terminal-widget.apk
  && rm -v -i termux-terminal-widget.apk
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

![Termux ADB/SSH Info Widget Screenshot 2](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/raw/main/adb-ssh-wifi-program2.png)
