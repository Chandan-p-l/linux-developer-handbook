# Chapter 24: System Update

You have a fresh installation of Ubuntu. The first rule of setting up any new operating system—whether it's Windows, macOS, or Linux—is to apply all available updates. 

While the installer downloaded some updates in the background during Chapter 20, we are going to use the **Terminal** to ensure the entire system is perfectly up-to-date. This will be your first real interaction with the command line.

## Learning Objectives
By the end of this chapter, you will:
- Run your first terminal commands.
- Understand what the `apt` package manager is.
- Learn how to update the package list and upgrade installed software.
- Understand the `sudo` command.

---

## Theory: The Package Manager (`apt`)

In Windows, if you want to update 5 different applications (like Chrome, Discord, Steam, VLC, and Node.js), you usually have to open all 5 applications and click "Check for Updates" inside each one. It is tedious.

In Linux, all software is managed centrally by a **Package Manager**. In Ubuntu, this package manager is called **APT** (Advanced Package Tool). 

When you tell APT to update the system, it connects to the official Ubuntu servers, checks the version numbers of *every single piece of software on your computer* (including the operating system itself), and downloads the updates all at once.

### The Two-Step Update Process

Updating via the terminal is always a two-step process:

1. **Update the List (`apt update`):** This command does NOT install any software. It simply downloads the latest "catalog" or "menu" of available software from the servers so your computer knows what the latest version numbers are.
2. **Upgrade the Software (`apt upgrade`):** This command looks at the new catalog, compares it to what is currently installed on your computer, and actually downloads and installs the newer versions.

### The `sudo` Command

Because updating the system modifies core system files, a normal user is not allowed to do it. You need Administrator privileges. 
In Linux, you gain temporary administrator powers by putting the word `sudo` (Super User DO) at the beginning of your command.

---

## Practical Example: Updating the System

1. Open your Terminal (`Ctrl + Alt + T`).
2. Type the following command and press Enter:
   ```bash
   sudo apt update
   ```
3. The terminal will ask for your password. **When you type your password, nothing will show up on the screen (no asterisks or dots).** This is a security feature. Just type it blindly and press Enter.
4. You will see text scrolling by as your computer downloads the latest catalog from `archive.ubuntu.com`. It will finish by saying "X packages can be upgraded."
5. Now, type the second command and press Enter:
   ```bash
   sudo apt upgrade
   ```
6. The terminal will list all the software that is about to be updated and ask: `Do you want to continue? [Y/n]`. 
7. Type `y` and press Enter.

Watch the text scroll by. You are now a hacker. 
When the green text `user@computer:~$` returns at the bottom, the process is finished.

---

## Terminal Output

Here is what the process looks like:

```text
user@ubuntu:~$ sudo apt update
[sudo] password for user: 
Hit:1 http://archive.ubuntu.com/ubuntu jammy InRelease
Get:2 http://security.ubuntu.com/ubuntu jammy-security InRelease [110 kB]
Get:3 http://archive.ubuntu.com/ubuntu jammy-updates InRelease [119 kB]
Fetched 229 kB in 1s (200 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
15 packages can be upgraded. Run 'apt list --upgradable' to see them.

user@ubuntu:~$ sudo apt upgrade
Reading package lists... Done
Building dependency tree... Done
The following packages will be upgraded:
  firefox libssl3 linux-generic linux-headers-generic linux-image-generic
15 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
Need to get 145 MB of archives.
After this operation, 12.5 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
```

---

## Tips & Warnings

> [!TIP]
> You can combine the two commands into a single line by using `&&`. The command `sudo apt update && sudo apt upgrade -y` will update the list, and if successful, automatically upgrade the software without asking for confirmation (the `-y` means "yes to all"). This is used in the `scripts/update-system.sh` script included in this repository.

> [!WARNING]
> Never interrupt the `apt upgrade` process by closing the terminal window while it is installing files. Doing so can corrupt the package manager database. Let it finish.

---

## Exercises

1. Open the terminal and run the update and upgrade commands. 
2. Even if the installer downloaded updates during setup, there are almost always a few more updates available by the time you reach the desktop.
3. Try typing `sudo apt autoremove` and pressing enter. This cleans up any old, unused dependency files left over from the upgrade.

---

## Quiz

**Question 1:** What does `sudo apt update` actually do?
- A) It installs the latest version of Ubuntu.
- B) It downloads the newest catalog/list of software versions from the servers, but does not install them.
- C) It updates the graphics drivers.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. It only updates the list. You must run `apt upgrade` to actually install the updates.
</details>

**Question 2:** Why doesn't your password show up on the screen when using `sudo`?
<details>
<summary>Click here for the answer</summary>
**Answer:** It is a built-in security feature to prevent people looking over your shoulder (shoulder surfing) from knowing how long your password is.
</details>

---

## Summary

The `apt` package manager is a powerful, centralized tool for keeping your entire system up-to-date. By running `sudo apt update` followed by `sudo apt upgrade`, you ensure your developer workstation is secure, stable, and running the latest software. 

## Next Chapter

The system is updated, but what about proprietary hardware like Nvidia graphics cards or specific Wi-Fi chips? In the next chapter, we will verify that all your hardware drivers are installed correctly.

[Go to Chapter 25: Drivers ➡️](25-drivers.md)
