# Chapter 18: The Boot Menu

By default, when you turn your computer on, the UEFI firmware immediately looks at the internal hard drive, finds Windows, and boots it. We need to interrupt this automatic process and tell the UEFI to boot from our small USB flash drive instead. 

To do this, we use the **Boot Menu**.

## Learning Objectives
By the end of this chapter, you will:
- Understand what the Boot Menu is.
- Find the specific keyboard key required to open the Boot Menu for your brand of computer.
- Successfully boot into the Ubuntu installer.

---

## Theory: Interrupting the Boot Sequence

The Boot Menu is a feature built into your motherboard's UEFI firmware. It allows you to temporarily override the default boot order for a single startup.

To access it, you must rapidly press a specific key on your keyboard during the very first seconds the computer turns on (before the Windows logo appears). 

If you see the Windows logo, or the little spinning dots at the bottom of the screen, **you were too late**. You must wait for Windows to load, shut down the computer completely, and try again.

### Finding Your Key

Every computer manufacturer uses a different key to access the Boot Menu. Here are the most common ones:

| Manufacturer | Boot Menu Key |
| :--- | :--- |
| **Dell** | `F12` |
| **HP** | `F9` (or `Esc` then `F9`) |
| **Lenovo** | `F12` (or the tiny physical "Novo" button on the side of the laptop) |
| **ASUS** | `F8` or `Esc` |
| **Acer** | `F12` |
| **MSI** | `F11` |
| **Gigabyte** | `F12` |
| **Microsoft Surface** | Hold `Volume Down`, press `Power`, release Vol Down when logo appears |
| **Apple (Mac)** | Hold `Option` (`Alt`) immediately after pressing Power |

*If your manufacturer is not listed, simply Google "Boot menu key [Your Laptop Brand]".*

---

## Practical Example: Entering the Boot Menu

1. Ensure both your small USB flash drive and your large External SSD are plugged into the computer.
2. Ensure your computer is **completely shut down**. (Do not use "Restart" or "Sleep". Click Start -> Power -> Shut Down).
3. Wait 10 seconds for the computer to completely power off.
4. Locate your Boot Menu key from the table above. Place your finger on it.
5. Press the Power button on your computer.
6. **IMMEDIATELY** start tapping the Boot Menu key repeatedly (tap-tap-tap-tap, about twice a second) like you are playing an arcade game.
7. Stop tapping when you see a menu appear on the screen.

### Selecting the USB Drive

The Boot Menu will look different depending on your computer. It might be an ugly blue screen, or a sleek graphical menu. 

You will see a list of drives.
- One will probably say `Windows Boot Manager` or the name of your internal drive (e.g., `Samsung MZVL...`).
- Another will be the name of your small USB Flash drive (e.g., `SanDisk Cruzer Glide` or `UEFI: Kingston DataTraveler` or `Ventoy`).

Use your arrow keys to highlight the **USB Flash Drive** and press **Enter**.

---

## Screenshots

![Boot Menu Placeholder](assets/images/boot-menu-placeholder.png)

*Figure 18.1: A typical laptop Boot Menu. Notice how the USB drive is listed separately from the Windows Boot Manager.*

---

## Tips & Warnings

> [!WARNING]
> If Windows keeps booting no matter how fast you tap the key, Windows might be using a feature called **"Fast Startup"**. Fast Startup doesn't actually shut down your computer; it puts it into deep hibernation, which skips the UEFI boot screen entirely. 
> To disable it: In Windows, go to Control Panel -> Power Options -> "Choose what the power buttons do" -> Click "Change settings that are currently unavailable" -> Uncheck "Turn on fast startup" -> Save changes -> Shut down again.

> [!TIP]
> If you are using Ventoy, you will see a second menu after selecting the USB drive. Select the Ubuntu `.iso` file from the Ventoy list and press Enter. 

---

## Exercises

1. Identify your Boot Menu key.
2. Perform the steps to enter the Boot Menu. 
3. If you accidentally boot into Windows, don't panic. Just shut down and try again. It often takes beginners two or three tries to get the timing right.

---

## Quiz

**Question 1:** When must you press the Boot Menu key?
- A) While Windows is loading.
- B) Immediately after pressing the power button, before the Windows logo or spinning dots appear.
- C) After logging into Windows.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. The UEFI firmware only listens for the Boot Menu key during the very brief POST sequence before it hands control to Windows.
</details>

**Question 2:** If you see the Windows logo while trying to enter the Boot Menu, what does it mean?
<details>
<summary>Click here for the answer</summary>
**Answer:** It means you were too slow pressing the key, or Windows "Fast Startup" is enabled. You must shut down and try again.
</details>

---

## Summary

The Boot Menu allows you to bypass the internal Windows drive and force the computer to boot from your small USB flash drive. By tapping the correct `F-key` during startup, you will launch the Ubuntu installer.

## Next Chapter

Once you select the USB drive, a black screen with white text will appear, followed by the Ubuntu logo. You are now leaving Windows entirely. Next, we will explore the "Live USB" environment before we actually install anything.

[Go to Chapter 19: Live USB ➡️](19-live-usb.md)
