# Chapter 5: Linux vs Windows

For a beginner, the transition from Windows to Linux can feel disorienting. Concepts that you take for granted in Windows are handled differently in Linux. This chapter will map your existing Windows knowledge to the Linux world, easing the transition.

## Learning Objectives
By the end of this chapter, you will:
- Understand the difference in how file systems are structured (C: Drive vs Root).
- Learn the Linux equivalents for common Windows applications.
- Understand how software installation differs.
- Grasp the conceptual differences in user permissions.

---

## Theory: The Fundamental Differences

### 1. The File System Structure

**Windows:**
Windows uses "Drive Letters" to represent different storage devices. Your main hard drive is usually `C:\`. If you plug in a USB drive, it becomes `D:\` or `E:\`.
File paths use backslashes: `C:\Users\John\Documents\file.txt`

**Linux:**
Linux does not use drive letters. Instead, it uses a single, unified hierarchy tree. 
At the very top of the tree is the **Root** directory, represented by a single forward slash: `/`.
Every device, hard drive, and USB stick is mounted *inside* this root directory. 
File paths use forward slashes: `/home/john/Documents/file.txt`

If you plug in a USB drive on Ubuntu, it won't appear as a new letter. It will appear as a folder inside the `/media/john/` directory.

### 2. The Registry vs Configuration Files

**Windows:**
Windows stores almost all system and application settings in a massive, hidden, binary database called the "Windows Registry". Editing the registry requires a special tool (`regedit`), and making a mistake can instantly destroy your Windows installation.

**Linux:**
Linux does not have a registry. Instead, all system configurations are stored in plain text files, usually located in the `/etc` directory. If you want to change how a program behaves, you simply open its configuration file in a text editor, change a line of text, and save it. It is transparent and easy to backup.

### 3. Software Installation (The App Store vs The Web)

**Windows:**
Historically, Windows users download software by searching the web, downloading an `.exe` file, and running an installer. This is dangerous (high risk of malware) and annoying (programs constantly asking you to update them).

**Linux:**
Linux uses **Package Managers**. Think of it like the Apple App Store or Google Play Store, but completely free and run via the terminal. You tell the package manager what you want (e.g., `sudo apt install firefox`), and it downloads the software from a secure, verified server, installs it, and updates it automatically along with your system updates.

### 4. User Permissions and `sudo`

**Windows:**
When you log into your personal Windows computer, you usually have "Administrator" privileges all the time. If a virus gets onto your computer, it also has Administrator privileges and can destroy your system.

**Linux:**
In Linux, you log in as a normal user with limited privileges. You cannot install software or modify system files. If you want to perform an administrative task, you must explicitly use the `sudo` command (Super User DO) and type your password. This acts as a massive security wall against malware.

---

## Practical Example: Translating Windows to Linux

Here is a cheat sheet mapping common Windows concepts to their Ubuntu equivalents:

| Concept / Task | Windows Equivalent | Ubuntu (Linux) Equivalent |
| :--- | :--- | :--- |
| File Manager | Windows Explorer | Nautilus (Files) |
| Task Manager | Task Manager (Ctrl+Shift+Esc) | System Monitor (or `htop` in terminal) |
| Command Line | CMD or PowerShell | Terminal (`bash` or `zsh`) |
| Install Software | Download `.exe` from web | `apt` package manager or Ubuntu Software Center |
| Main Drive | `C:\` | `/` (Root) |
| User Folder | `C:\Users\Name` | `/home/name` |
| Text Editor | Notepad | Gedit (or `nano` in terminal) |
| System Settings | Control Panel / Settings | Settings App |

---

## Tips & Warnings

> [!TIP]
> Because Linux file paths use forward slashes (`/`), typing URLs on the web will feel much more natural, as the internet is built on Linux servers that use the exact same path structures!

> [!WARNING]
> Linux is **case-sensitive**. In Windows, a file named `Resume.pdf` is the same as `resume.pdf`. In Linux, they are completely different files. This often trips up beginners when writing code!

---

## Exercises

1. Memorize the difference between a backslash `\` (Windows) and a forward slash `/` (Linux).
2. Look at your Windows `C:\` drive. Imagine taking everything inside it and putting it under a single `/` folder. This is how you should visualize your upcoming Linux drive.

---

## Quiz

**Question 1:** If you plug a USB drive into a Linux machine, what will it be called?
- A) The D:\ Drive
- B) A folder mounted inside the Root directory tree (e.g., `/media/user/usb`)
- C) The Linux Registry

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Linux mounts all hardware as folders inside the single Root directory tree. It does not use Drive Letters.
</details>

**Question 2:** True or False: Linux stores its system settings in a binary database called the Registry.
<details>
<summary>Click here for the answer</summary>
**Answer: False**. Linux stores settings in plain, human-readable text files, usually located in the `/etc` folder.
</details>

---

## Summary

Moving from Windows to Linux requires a slight mental shift. You must forget about `C:\` drives, `.exe` installers, and the Registry. In exchange, you get a logical, text-based file system, secure package managers, and a system built entirely around transparent files.

## Next Chapter

We've covered the software side. Now let's talk about the hardware. Why are we specifically installing this on an *external* SSD instead of just using the hard drive inside your computer?

[Go to Chapter 6: Why External SSD ➡️](06-why-external-ssd.md)
