# Termux-ADB-SSH-StartUp_Connection-Info-Widget [ROOT-REQUIRED]

![Termux ADB/SSH Info Widget Screenshot 1](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/blob/main/ADB_SSH_Widget_STARTED_Displaying_IP_PORTs.png)

![Termux ADB/SSH Info Widget Screenshot 2](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/blob/main/ADB_SSH_Widget_STOPPED.png)

Finally, a quick and easy way to interact with your Android device using both **ADB** and **SSH** shells—while always staying up to date on your current IP and the ports needed to connect!
No more digging through **Developer Options**, typing in complex port numbers, constantly running **ip r** in Termux, or searching Wi-Fi settings for your current IP address.
All connection info is displayed in the Termux Widget. The start and stop scripts are run separately from termux tasker. 

This script is for Termux Widget and displays your device’s **ADB** & **SSH** connection info, enables or disables **ADB** over Wi-Fi and SSH at the same time(root required for scripts), and shows the local IP and ports in a centerized widget on your home screen. Perfect for quick wireless access to your Android device and your power use developer flow. 

---

## Features

- Enables ADB over TCP/IP on port 5555 (requires root), avoiding the complex, ever-changing random ports used by newer Android. Port 5555 is the classic ADB Wi-Fi default—easy to remember and makes connecting simple.
- Starts the SSH daemon (sshd).
- Widget Automatically detects the device's `wlan0` IP address. 
- Automatically detects the SSH port from `~/.ssh/sshd_config` (defaults to 8022 in Android Termux).
- Displays connection information in a visually appealing, centered box. 
- Optionally keeps the device awake using `termux-wake-lock` or use the caffeine widget instead. 
- Access your phone’s **ADB** shell or **SSH** shell in Termux—even when the **screen is off!**
- Use the `scrcpy` command-line tool to remotely control and view your phone’s screen over Wi-Fi! By using **"scrcpy -K $IP"** your computer becomes the source of the keyboard and your phone's touch keyboard won't pop up. Very handy for programming your phone further and making typing complex CMDs or Passwords a breeze. And to add to the Magic, you can now copy back and forth text from your Phone to your computer!
- Experience the power of seamless device control with the scrcpy command-line tool! Effortlessly view and interact with your phone’s screen over Wi-Fi—no cables required. Simply run scrcpy -K $IP, and your computer’s keyboard instantly takes over—say goodbye to your phone’s touch keyboard popping up! It’s an absolute game-changer for typing complex coding commands, or typing in complex and secure passwords. But that’s not all: unlock the true **Magic** of **Cross-Device Productivity** by copying and pasting text freely between your phone and computer. Supercharge your workflow and transform the way you interact with your mobile device!
---

## Preview

When run, the script will produce a centered output in your terminal or widget like this:
```
***********************************
***********************************
***** ADB: 192.168.1.$IP:5555 *****
***** SSH: 192.168.1.$IP:8022 *****
***********************************
***********************************
```
*(Note: The IP address will be your device's local IP. Output appears directly in the widget or terminal.)*

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
  
  **Install the Termux: **Boot app (from F-Droid or your preferred FOSS repo).

  If you want SSH started at boot the old way: In Termux, set up the boot script:
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

Download the needed 3 Scripts: 
#1 Display Info Widget Script
#2 Start Services Script
#3 Stop Services Script

Save these scripts in your Termux ~/.shortcuts/ directory:

Make the Scripts Executable:
```
chmod +x ~/.shortcuts/*.sh
```
Add the Termux Tasker Widget to Your Home Screen. This will launch the start and stop scripts as seen in the screenshots.

Copy-Paste via Widget Setup

Copy the display info script to the clipboard, long-press the widget, choose “edit,” and paste the script right into the widget’s code box.

![Termux ADB/SSH Info Widget Screenshot 2](https://github.com/shi88ihs/Termux-ADB-SSH-StartUp_Connection-Info-Widget/raw/main/adb-ssh-wifi-program2.png)
