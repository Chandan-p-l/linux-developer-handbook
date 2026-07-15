# Chapter 16: Ventoy

In the previous chapter, we learned how to use Rufus to create a bootable USB drive. Rufus is excellent, but it has one flaw: every time you want to try a new Linux distribution (like switching from Ubuntu to Fedora), you have to completely erase the USB drive and use Rufus again. 

What if you could just drag and drop the `.iso` file onto the USB drive like a normal file, and the computer would magically boot it? That is exactly what **Ventoy** does.

## Learning Objectives
By the end of this chapter, you will:
- Understand how Ventoy differs from Rufus.
- Learn how to install Ventoy onto your small USB flash drive.
- Understand how to boot multiple ISOs from a single drive.

---

## Theory: The Multi-Boot USB

**Ventoy** is a modern, open-source tool that revolutionizes how we create bootable media.

When you use Ventoy, you don't "burn" the ISO to the drive. Instead, Ventoy installs a tiny, hidden bootloader program onto the USB flash drive. The rest of the USB drive is left as a normal, empty exFAT storage partition.

**The Magic Trick:**
Once Ventoy is installed on the flash drive, you simply drag and drop your downloaded Ubuntu `.iso` file straight onto the drive using Windows Explorer. 

When you boot your computer from this USB drive, the Ventoy bootloader wakes up, scans the drive, finds the `.iso` file, and presents you with a menu. You select the `.iso`, and Ventoy injects it directly into the computer's memory, booting it instantly.

If you have a large enough flash drive, you can put the Ubuntu ISO, the Windows 11 ISO, and the Debian ISO all on the same drive. Ventoy will list all of them in a menu.

---

## Practical Example: Setting up Ventoy

If you want to use Ventoy instead of Rufus, follow these steps:

### Step 1: Download and Install
1. Go to the official Ventoy GitHub releases page: [https://github.com/ventoy/Ventoy/releases](https://github.com/ventoy/Ventoy/releases)
2. Download the `windows.zip` file (e.g., `ventoy-1.0.97-windows.zip`).
3. Extract the ZIP file to a folder on your Windows PC.
4. Plug in your small, temporary 8GB USB Flash Drive.
5. Open the extracted folder and run `Ventoy2Disk.exe`.

### Step 2: Configure and Format
The Ventoy interface is very simple.
1. Look at the **Device** dropdown and ensure your small 8GB flash drive is selected. (Again, do not select your external SSD!).
2. Go to the **Option** menu at the top -> **Partition Style** -> Select **GPT** (Crucial for modern UEFI).
3. Go to the **Option** menu at the top -> **Secure Boot Support** -> Ensure there is a checkmark next to it.
4. Click the **Install** button. It will warn you twice that the drive will be formatted. Click Yes.

### Step 3: Copy the ISO
Once Ventoy is installed, your USB drive will appear in Windows as an empty drive called "Ventoy".
1. Open your Downloads folder.
2. Copy the `ubuntu-24.04-desktop-amd64.iso` file.
3. Paste it directly into the empty "Ventoy" USB drive.

You are done. The flash drive is now a bootable Ubuntu installer.

---

## Screenshots

![Ventoy Interface Placeholder](assets/images/ventoy-placeholder.png)

*Figure 16.1: The Ventoy installer interface in Windows.*

![Ventoy Boot Menu Placeholder](assets/images/ventoy-boot-placeholder.png)

*Figure 16.2: The Ventoy boot menu as it appears when you start your computer. Notice how it lists the ISO files.*

---

## Tips & Warnings

> [!TIP]
> If you have a large 64GB or 128GB flash drive, Ventoy is highly recommended. You can use half the drive to hold ISO files for fixing computers, and the other half for normal file storage like a regular thumb drive.

> [!WARNING]
> Do NOT extract or unzip the `.iso` file before copying it to Ventoy. Ventoy requires the file to be left perfectly intact as a single `.iso` file.

---

## Exercises

1. Decide whether you want to use Rufus or Ventoy for your installation. Either will work perfectly for this guide.
2. If you choose Ventoy, install it to your small flash drive, ensure the partition style is GPT, and copy the Ubuntu ISO onto it.

---

## Quiz

**Question 1:** What is the primary advantage of Ventoy over Rufus?
- A) Ventoy makes the computer run faster.
- B) You do not need to reformat the drive every time you want to try a new ISO; you just copy the `.iso` file to the drive like normal data.
- C) Ventoy uses MBR instead of GPT.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Ventoy allows you to keep multiple ISOs on a single drive and boot from any of them without reformatting.
</details>

**Question 2:** After installing Ventoy to the USB drive, what do you do with the Ubuntu `.iso` file?
<details>
<summary>Click here for the answer</summary>
**Answer:** You simply drag and drop (copy/paste) the `.iso` file onto the Ventoy USB drive using Windows Explorer.
</details>

---

## Summary

Ventoy is a next-generation tool for creating bootable media. By installing a smart bootloader on the flash drive, it allows you to boot directly from raw `.iso` files simply by dragging and dropping them onto the drive. This makes it an incredibly powerful tool for developers and IT professionals.

## Next Chapter

Regardless of whether you used Rufus or Ventoy, you now have a bootable Ubuntu installation USB drive. In the next chapter, we will summarize the exact physical setup required before we restart the computer.

[Go to Chapter 17: Create Bootable USB ➡️](17-create-bootable-usb.md)
