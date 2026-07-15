# Chapter 23: First Boot

You pressed Enter on "Ubuntu" in the GRUB menu. 
The screen went black, the Ubuntu logo appeared with a spinning loading circle, and after a few seconds, you were presented with a login screen. 

You type your password, press Enter, and the GNOME Desktop appears. 

Congratulations! You are officially running a full Linux operating system from an external SSD. You are now a Linux user. This chapter will walk you through your first few minutes in the new OS.

## Learning Objectives
By the end of this chapter, you will:
- Navigate the GNOME desktop interface.
- Understand the App Grid and the Dock.
- Connect your online accounts (optional).
- Locate the Terminal application.

---

## Theory: The Desktop Environment (GNOME)

In Windows, the taskbar, the start menu, and the window borders are all baked deeply into the operating system. You cannot change them.

In Linux, the graphical interface is just another piece of software running on top of the kernel. This software is called a **Desktop Environment (DE)**. Because Linux is open-source, you can completely rip out the default interface and install a different one (like KDE Plasma, XFCE, or Cinnamon) if you want it to look exactly like Windows or macOS.

However, Ubuntu comes with a highly polished, customized version of **GNOME**. It is modern, stable, and excellent for developer workflows.

### The Layout

1. **The Top Bar:** 
   - **Center:** The Clock and Calendar. (Clicking it shows notifications).
   - **Right:** The System Menu. (Wi-Fi, Bluetooth, Volume, Power Off, Settings).
2. **The Dock (Left Side):** 
   - This holds your favorite applications and currently running apps (similar to the Windows Taskbar or macOS Dock).
3. **The App Grid (Bottom Left):** 
   - At the very bottom of the Dock is an icon with 9 dots. This is the "Show Applications" button. Clicking it opens a full-screen grid of all installed software, similar to a smartphone app drawer.
4. **Activities Overview:**
   - Press the `Super` key (the key with the Windows logo on your keyboard). The screen will zoom out, showing all your open windows, allowing you to easily switch between them or type to search for apps.

---

## Practical Example: First Steps

When you log in for the first time, a "Welcome to Ubuntu" wizard will pop up.

1. **Connect Online Accounts:** You can connect your Google or Microsoft account. This automatically syncs your calendar and allows you to access your Google Drive directly in the Ubuntu file manager. (You can skip this if you want).
2. **Help improve Ubuntu:** You can choose whether to send anonymous system info to Canonical.
3. **Privacy:** Turn on Location Services if you want weather apps to work automatically.
4. **You're ready to go!:** Click Done.

### Finding the Terminal

As a developer, the Terminal will become your best friend. 

1. Click the **Show Applications** button (the 9 dots).
2. Type `Terminal` in the search bar.
3. Click the black terminal icon.
4. **Pro-Tip:** Right-click the Terminal icon on the left dock and select **"Add to Favorites"**. This pins it to the dock so you never have to search for it again.

---

## Screenshots

![First Boot Welcome Screen Placeholder](assets/images/ubuntu-first-boot-placeholder.png)

*Figure 23.1: The Welcome Wizard on the first boot of Ubuntu.*

---

## Tips & Warnings

> [!TIP]
> **Keyboard Shortcuts:**
> - `Super` (Windows key) = Open Activities / Search
> - `Ctrl + Alt + T` = Open a new Terminal window instantly. (Memorize this!)
> - `Super + D` = Show Desktop (minimize all windows).

> [!NOTE]
> If your screen scaling looks weird (e.g., everything is way too small on a 4K laptop screen), click the top-right system menu -> **Settings** -> **Displays**, and change the "Scale" to 150% or 200%.

---

## Exercises

1. Memorize the `Ctrl + Alt + T` shortcut to open the terminal. Try it right now.
2. Open the **Settings** app and explore. Change the desktop wallpaper and switch the system appearance to "Dark Mode".
3. Open the **Files** app (the filing cabinet icon) and look at your Home folder. Notice the standard folders: Desktop, Documents, Downloads, Music, Pictures, Videos.

---

## Quiz

**Question 1:** What is the name of the default Desktop Environment used in Ubuntu?
- A) Windows Explorer
- B) GNOME
- C) The Terminal

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Ubuntu uses a customized version of the GNOME desktop environment.
</details>

**Question 2:** What is the keyboard shortcut to instantly open a Terminal window?
<details>
<summary>Click here for the answer</summary>
**Answer: `Ctrl + Alt + T`**. You will use this shortcut every single day as a developer.
</details>

---

## Summary

You have successfully booted into your new operating system. The GNOME desktop is clean, intuitive, and highly functional. By pinning the Terminal to your dock and learning a few basic keyboard shortcuts, you are ready to begin transforming this blank canvas into a powerful development environment.

## Next Chapter

Before we install Visual Studio Code or Docker, we must do what every IT professional does first on a new system: Update the software packages and secure the system. We will do this using the terminal.

[Go to Chapter 24: System Update ➡️](24-system-update.md)
