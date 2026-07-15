# Chapter 19: The Live USB Environment

If you successfully selected your USB drive in the Boot Menu, your screen probably went black, printed some white text, and then showed the Ubuntu logo. A few moments later, a beautiful desktop environment appeared with a welcome screen.

Before we click "Install," we need to understand what is currently happening. You are currently running a **Live USB Environment**.

## Learning Objectives
By the end of this chapter, you will:
- Understand the concept of a Live Operating System.
- Learn why the Live USB is a powerful troubleshooting tool.
- Connect to Wi-Fi before starting the installation.
- Verify your hardware works in Linux.

---

## Theory: The OS in RAM

Where is the operating system running from right now?

It's not on your internal hard drive. It's not on your external SSD (that is still empty). 
Right now, Ubuntu is running entirely off the **small USB flash drive** and inside your computer's **RAM (Memory)**.

This is a "Live Environment" (often called a Live CD or Live USB). 

### The Magic of the Live Environment
Because Ubuntu is running from RAM, it is completely temporary and extremely safe.
- You can open the web browser, surf the internet, and create text files.
- You can change the desktop wallpaper.
- If you restart the computer, everything you just did will vanish instantly. It leaves absolutely zero trace on your computer.

### The Ultimate Troubleshooting Tool
IT professionals carry Live USBs everywhere. If a Windows computer gets a terrible virus and won't boot, an IT admin will boot the computer using an Ubuntu Live USB. Because the virus only affects Windows, the Ubuntu Live USB will bypass it, allowing the admin to copy the user's files safely to a backup drive.

---

## Practical Example: Testing Your Hardware

Before we commit to installing Ubuntu, we should use the Live Environment to ensure your laptop's hardware is compatible with Linux. (Ubuntu is compatible with 99% of modern hardware, but it's always good to check).

On the welcome screen, you will usually see an option to **"Try Ubuntu"** or **"Install Ubuntu"**.
Click **"Try Ubuntu"**.

The welcome window will close, giving you full access to the Ubuntu desktop.

### 1. Connect to Wi-Fi
In the top-right corner of the screen, you will see a cluster of icons (network, volume, battery). Click this area.
A menu will drop down. Click on the **Wi-Fi** section, select your home network, and enter your password. 
*If you see your Wi-Fi networks, congratulations! Your Wi-Fi card has drivers in Linux.*

### 2. Test Audio
Click the volume slider in the top right menu and move it up and down. You should hear a 'pop' sound. 
*If you hear sound, your audio card is working perfectly.*

### 3. Test Trackpad
Move your mouse around. Try tapping to click. Try scrolling with two fingers.
*If it works, your trackpad is supported.*

---

## Screenshots

![Ubuntu Live Environment Placeholder](assets/images/ubuntu-live-placeholder.png)

*Figure 19.1: The Ubuntu Live Environment desktop. Notice the "Install Ubuntu" icon on the desktop.*

---

## Tips & Warnings

> [!NOTE]
> The Live Environment will feel noticeably sluggish compared to a real installation. This is because it is reading data from your slow, small USB thumb drive, not a fast SSD. Do not judge Ubuntu's performance based on the Live USB!

> [!IMPORTANT]
> Connecting to Wi-Fi during this step is highly recommended. When we launch the installer, having an internet connection allows Ubuntu to download the latest security updates and proprietary graphics drivers (like Nvidia drivers) automatically.

---

## Exercises

1. Boot into the "Try Ubuntu" Live Environment.
2. Open the **Firefox Web Browser** (the orange fox icon on the left dock).
3. Go to YouTube and play a video. This tests your Wi-Fi, audio, and basic graphics drivers all at once.

---

## Quiz

**Question 1:** Where is the Ubuntu operating system running from when you are in the "Try Ubuntu" mode?
- A) The internal Windows hard drive.
- B) The external SSD.
- C) It is loaded into the computer's RAM from the small USB flash drive.

<details>
<summary>Click here for the answer</summary>
**Answer: C**. The OS exists entirely in the temporary RAM. Restarting the computer wipes it away completely.
</details>

**Question 2:** Why should you connect to Wi-Fi while in the Live Environment before clicking Install?
<details>
<summary>Click here for the answer</summary>
**Answer:** So the installer can automatically download the latest system updates, security patches, and third-party hardware drivers during the installation process.
</details>

---

## Summary

The Live USB environment is a powerful feature of Linux that allows you to test the operating system and verify hardware compatibility without installing anything or risking your Windows data. Once you have connected to Wi-Fi and confirmed your hardware works, you are ready to launch the installer.

## Next Chapter

The moment of truth has arrived. In the next chapter, we will double-click the "Install Ubuntu" icon and begin the installation process onto the External SSD.

[Go to Chapter 20: Installation ➡️](20-installation.md)
