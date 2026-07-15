# Chapter 15: Rufus

We have our verified Ubuntu `.iso` file, and we have our small, temporary 8GB USB Flash Drive. 

You cannot just drag and drop the `.iso` file onto the flash drive. The computer's UEFI firmware will not know what to do with it. We need to extract the ISO and write it to the USB drive in a very specific, bootable way. To do this, we use a tool called **Rufus**.

## Learning Objectives
By the end of this chapter, you will:
- Understand what Rufus does.
- Learn how to download and run Rufus safely.
- Configure Rufus specifically for modern UEFI systems (GPT).

---

## Theory: The USB Flasher

Rufus is a free, open-source application for Windows. Its only job is to format USB flash drives and turn them into bootable installation media.

When you feed the Ubuntu `.iso` file into Rufus, Rufus does several things automatically:
1. It formats the small USB flash drive (erasing everything on it).
2. It sets up a tiny FAT32 EFI partition on the USB drive so your computer's UEFI can recognize it.
3. It extracts the thousands of files locked inside the `.iso` archive.
4. It copies those extracted files onto the USB drive.

Once Rufus is finished, that small USB drive acts exactly like an original, store-bought Ubuntu installation DVD.

---

## Practical Example: Using Rufus

*(Note: In the next chapter, we will introduce an alternative to Rufus called Ventoy. You can choose to use either one. Rufus is the traditional method.)*

### Step 1: Download Rufus
1. On your Windows PC, go to the official Rufus website: [https://rufus.ie/](https://rufus.ie/)
2. Scroll down to the Download section and click the link for the standard version (e.g., `rufus-4.4.exe`).
3. Rufus is a portable application. You do not need to install it. Just double-click the `.exe` file in your Downloads folder to run it.

### Step 2: The Configuration
Plug your small, temporary 8GB USB Flash Drive into your computer. 

Open Rufus. Ensure the settings look exactly like this:

- **Device:** Select your small 8GB USB flash drive. *(Warning: Make absolutely sure you do not select your external SSD or an external backup drive!)*
- **Boot selection:** Click the "SELECT" button and choose the Ubuntu `.iso` file you downloaded.
- **Partition scheme:** Change this to **GPT**. (Remember Chapter 12!)
- **Target system:** It will automatically change to **UEFI (non CSM)**.
- **Volume label:** Leave it as default (e.g., Ubuntu 24.04).
- **File system:** Leave it as default (usually FAT32).

### Step 3: Write the Image
Click the **START** button.
- Rufus might warn you that it needs to download some "Syslinux" files. Click Yes.
- Rufus will prompt you asking if you want to write in "ISO Image mode" or "DD Image mode". Leave it on the recommended **ISO Image mode** and click OK.
- Rufus will display a massive warning that ALL DATA on the USB drive will be destroyed. Confirm you have selected the correct small flash drive, and click OK.

Wait 3 to 10 minutes for the green bar to complete. When it says "READY" at the bottom, click Close. 

---

## Screenshots

![Rufus Configuration Placeholder](assets/images/rufus-placeholder.png)

*Figure 15.1: The Rufus interface. Notice the Partition scheme is set to GPT and Target system is UEFI.*

---

## Tips & Warnings

> [!WARNING]
> Rufus is a powerful formatting tool. If you select the wrong drive in the "Device" dropdown (like an external hard drive containing family photos), it will be irreversibly erased in seconds. Double-check the drive letter and capacity.

> [!IMPORTANT]
> A common beginner mistake is leaving the Partition scheme on "MBR". If you do this, your modern UEFI computer will not see the USB drive when you try to boot from it. Always select GPT.

---

## Exercises

1. Download Rufus from `rufus.ie`.
2. Open it, plug in your small flash drive, and examine the interface. 
3. Try selecting the Ubuntu ISO and watching how Rufus automatically adjusts its settings. (You don't have to click Start yet if you want to read about Ventoy in the next chapter).

---

## Quiz

**Question 1:** Why can't you just drag and drop the `.iso` file onto the USB drive?
- A) The file is too large for the USB drive.
- B) The UEFI firmware cannot boot a raw `.iso` file; the files must be extracted and a boot sector must be created.
- C) Windows will not allow you to copy files ending in `.iso`.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Rufus creates the necessary EFI boot partitions and extracts the files so the motherboard firmware can execute them.
</details>

**Question 2:** Which Partition Scheme must you select in Rufus for a modern computer?
<details>
<summary>Click here for the answer</summary>
**Answer: GPT**. Modern computers use UEFI, which requires the GPT partition scheme.
</details>

---

## Summary

Rufus is the standard Windows tool for converting an `.iso` file into a bootable USB flash drive. By configuring it to use the GPT partition scheme, we ensure the USB drive will be recognized by our modern computer's UEFI firmware.

## Next Chapter

Rufus is great, but there is a newer, more advanced tool that allows you to put *multiple* operating systems on a single flash drive without ever extracting the ISO files. In the next chapter, we will look at Ventoy.

[Go to Chapter 16: Ventoy ➡️](16-ventoy.md)
