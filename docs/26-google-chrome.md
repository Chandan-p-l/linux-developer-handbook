# Chapter 26: Google Chrome

Ubuntu comes with Mozilla Firefox pre-installed as the default web browser. Firefox is an excellent, open-source browser that respects your privacy. 

However, as a developer, you will likely need **Google Chrome**. The Chrome Developer Tools (DevTools) are the industry standard for web development, debugging JavaScript, and inspecting CSS.

## Learning Objectives
By the end of this chapter, you will:
- Understand `.deb` files (the Linux equivalent of `.exe`).
- Learn how to download and install Google Chrome using the Terminal.
- Learn how to run a pre-written shell script.

---

## Theory: The `.deb` Package

In Chapter 24, we learned how to install software using the `apt` package manager from the official Ubuntu servers. 

But what if the software you want isn't on the official Ubuntu servers? Google Chrome is proprietary software, so Canonical (the company behind Ubuntu) is not allowed to host it on their servers. 

To install it, you must download it directly from Google.

In Windows, you download an `.exe` file. 
In Ubuntu (and all Debian-based distributions), you download a **`.deb`** (Debian) package.

A `.deb` file is essentially a ZIP file that contains the application, plus a set of instructions telling the package manager where to put the files and how to add the application to your system menus.

---

## Practical Example: Two Ways to Install

You can install Chrome using the graphical interface (GUI) or the Terminal. We will use the Terminal because it is faster and helps you learn command-line skills.

*(Note: We have also provided an automated script for this in the `scripts/install-chrome.sh` file of this repository).*

### Method 1: The Manual Terminal Way

1. Open your Terminal (`Ctrl + Alt + T`).
2. First, we use `wget` to download the `.deb` file directly from Google's servers. Type this and press Enter:
   ```bash
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   ```
   *Watch the progress bar as it downloads the ~100MB file into your Home folder.*
3. Now, we use the `dpkg` (Debian Package) tool to install it. Because installing software requires admin rights, we must use `sudo`. Type this:
   ```bash
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   ```
4. Press Enter and type your password.
5. If the terminal throws an error about "missing dependencies", run this command to fix it automatically:
   ```bash
   sudo apt-get install -f
   ```
6. The installation is complete. You can delete the `.deb` installer file to save space:
   ```bash
   rm google-chrome-stable_current_amd64.deb
   ```

### Method 2: The Automated Script Way

In Chapter 2, we cloned/downloaded this guide's repository. We have provided a script that runs all the commands above automatically.

1. Open Terminal.
2. Navigate to the scripts folder (assuming you saved the repo in Documents):
   ```bash
   cd ~/Documents/ubuntu-external-ssd-guide/scripts
   ```
3. Run the script:
   ```bash
   ./install-chrome.sh
   ```
   *(If it says "Permission denied", you must make the script executable first: `chmod +x install-chrome.sh`)*

---

## Screenshots

![Chrome Terminal Install Placeholder](assets/images/chrome-install-placeholder.png)

*Figure 26.1: Using the wget command to download the Chrome .deb package in the terminal.*

---

## Tips & Warnings

> [!TIP]
> When you install Chrome via the `.deb` package, Google cleverly adds its own server address to your `apt` package manager's list. This means that in the future, when you run `sudo apt upgrade`, Google Chrome will update automatically alongside the rest of your system!

> [!WARNING]
> Never download `.deb` files from random, untrusted websites. Just like `.exe` files in Windows, a `.deb` file has root access to your computer during installation and can install malware. Only download from official sources (like `google.com`).

---

## Exercises

1. Install Google Chrome using the Terminal method.
2. Press the `Super` (Windows) key, search for "Chrome", and open it.
3. Right-click the Chrome icon on the dock and select **Add to Favorites** to pin it next to the Terminal.

---

## Quiz

**Question 1:** What is the Ubuntu equivalent of a Windows `.exe` installer file?
- A) `.app`
- B) `.iso`
- C) `.deb`

<details>
<summary>Click here for the answer</summary>
**Answer: C**. The `.deb` (Debian Package) is the standard installer file format for Ubuntu.
</details>

**Question 2:** Which terminal command is used to download a file directly from a URL?
<details>
<summary>Click here for the answer</summary>
**Answer: `wget`**. It is an incredibly powerful tool for downloading files without needing a graphical web browser.
</details>

---

## Summary

While package managers (`apt`) are the primary way to install software in Linux, proprietary apps like Google Chrome require you to download and install a `.deb` package directly from the manufacturer. You can install these packages effortlessly using the `wget` and `dpkg` terminal commands.

## Next Chapter

You have a web browser. Now you need a place to write code. In the next chapter, we will install Microsoft Visual Studio Code, the most popular code editor in the world.

[Go to Chapter 27: VS Code ➡️](27-vscode.md)
