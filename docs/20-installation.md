# Chapter 20: Installation Preparation

You are in the Ubuntu Live Environment, connected to Wi-Fi, and ready to install. On your desktop, you will see an icon labeled **"Install Ubuntu"**. 

Double-click it. 

This chapter will guide you through the initial screens of the installer. The partitioning screen (which requires extreme care) is so important that it gets its own dedicated chapter next.

## Learning Objectives
By the end of this chapter, you will:
- Navigate the initial setup screens of the Ubuntu Installer.
- Understand the difference between Normal and Minimal installation.
- Configure third-party software and updates.

---

## Theory: The Installer Flow

The Ubuntu installer (often named *Ubiquity* or *Subiquity* depending on the version) is designed to be as friendly as possible. It asks you a series of questions, gathers your preferences, and then applies them all at once at the very end.

You will not accidentally break anything by clicking "Next" on these early screens. No changes are actually written to any hard drive until you reach the final confirmation screen (which we will cover in Chapter 21).

---

## Practical Example: The Setup Screens

Follow these steps exactly:

### 1. Language
Select your preferred language (e.g., English) and click **Continue**.

### 2. Keyboard Layout
Select your keyboard layout (e.g., English (US)). You can type in the test box to make sure special characters like `@` and `#` appear correctly. Click **Continue**.

### 3. Updates and Other Software
This is a very important screen. You will see several checkboxes.

**What apps would you like to install to start with?**
- **Normal Installation:** Installs a web browser, office suite (LibreOffice), games, and media players.
- **Minimal Installation:** Installs ONLY a web browser and basic utilities.
*Recommendation:* Because this is a Developer Workstation, choose **Minimal Installation**. You don't need Solitaire or an Office suite. Minimal keeps the OS clean and fast, and you will install your dev tools later via the terminal.

**Other Options:**
- **[X] Download updates while installing Ubuntu:** CHECK THIS BOX. This saves you time later by installing the latest security patches immediately. (Requires the Wi-Fi connection we set up in the last chapter).
- **[X] Install third-party software for graphics and Wi-Fi hardware:** CHECK THIS BOX. This is critical. If you have an Nvidia graphics card or a specific Broadcom Wi-Fi chip, checking this box tells Ubuntu to install the proprietary drivers required to make them work perfectly. 

*Note: If you have Secure Boot enabled, checking the third-party software box might ask you to create a temporary password (MOK key). Just enter a simple password like `12345678`. You will be asked to enter it once when the computer reboots.*

Click **Continue**.

### 4. Installation Type (STOP HERE)
The next screen is titled **Installation Type**. 
It will present options like "Install Ubuntu alongside Windows Boot Manager", "Erase disk and install Ubuntu", or "Something else".

**DO NOT CLICK ANYTHING ON THIS SCREEN YET.**

This is the partitioning screen. This is the only place in the entire guide where you can make a catastrophic mistake and delete Windows. Take a deep breath, take your hands off the mouse, and move to the next chapter.

---

## Screenshots

![Updates and Software Placeholder](assets/images/ubuntu-updates-placeholder.png)

*Figure 20.1: The Updates and Other Software screen. Selecting Minimal Installation and checking both boxes is highly recommended for developers.*

---

## Tips & Warnings

> [!WARNING]
> If you did not connect to Wi-Fi during the Live Environment step, the "Download updates" box will be grayed out and unclickable.

> [!TIP]
> Linux purists sometimes argue against installing "third-party (proprietary) software" because the code is closed-source. As a beginner, ignore them. You want your graphics card and Wi-Fi to work. Check the box.

---

## Exercises

1. Launch the installer and progress through the Language, Keyboard, and Updates screens.
2. Select Minimal Installation and check the third-party drivers box.
3. Arrive at the "Installation Type" screen and **STOP**.

---

## Quiz

**Question 1:** Why is "Minimal Installation" recommended for a Developer Workstation?
- A) It costs less money.
- B) It prevents the installation of unnecessary bloatware like games and office suites, keeping the system lean and fast for coding.
- C) It installs faster.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Developers generally prefer a clean, minimal system where they only install the specific tools they need.
</details>

**Question 2:** Why must you check the "Install third-party software" box?
<details>
<summary>Click here for the answer</summary>
**Answer:** Without this box checked, Ubuntu will only use open-source drivers. This means things like Nvidia graphics cards or specific Wi-Fi chips might not work correctly, leading to a poor experience.
</details>

---

## Summary

The initial setup screens of the Ubuntu installer configure your language, keyboard, and software preferences. By selecting a Minimal Installation and enabling third-party drivers, you lay the groundwork for a lean, highly compatible developer machine. You must now stop at the "Installation Type" screen to prepare for partitioning.

## Next Chapter

This is it. The most important chapter in the guide. We will manually partition the External SSD to ensure Windows is untouched, create an EFI partition for booting, and create an exFAT partition for shared data. Proceed with caution.

[Go to Chapter 21: Partitioning ➡️](21-partitioning.md)
