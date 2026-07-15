# Chapter 21: Partitioning

You are at the **Installation Type** screen. This is the most critical step in the entire guide. You must manually partition the External SSD. If you choose the wrong drive, you will delete Windows. If you follow these instructions precisely, you will be 100% safe.

## Learning Objectives
By the end of this chapter, you will:
- Identify your internal Windows drive versus your external SSD.
- Create an EFI System Partition for the bootloader.
- Create an ext4 Root partition for the Ubuntu OS.
- Create an exFAT Shared Data partition for cross-OS file access.

---

## Theory: The Three Slices

We are going to use the **"Something else"** option in the installer to take manual control. We will take your large, empty External SSD and slice it into three specific partitions:

1. **EFI System Partition (ESP):** (Size: 500 MB)
   - **Format:** FAT32
   - **Purpose:** This tells the computer's UEFI how to boot the drive. It holds the bootloader (GRUB). 
2. **Root Partition (`/`):** (Size: 100 GB to 150 GB)
   - **Format:** ext4
   - **Purpose:** This is the `C:\` drive of Linux. It holds the Ubuntu Operating System, all your installed developer apps (VS Code, Node.js, Docker), and the system files.
3. **Shared Data Partition:** (Size: The Rest of the Drive)
   - **Format:** exFAT
   - **Purpose:** This is your storage warehouse. Because it is formatted in exFAT, both Windows and Linux can read and write to it. You will save your coding projects, photos, and documents here.

*Note: In older tutorials, you might see people creating a "Swap" partition. Modern Ubuntu uses a Swap File (like Windows) instead of a dedicated partition, so we do not need to create one manually.*

---

## Practical Example: The Partitioning Process

On the **Installation Type** screen, click **Something else** and click **Continue**.

You are now in the Advanced Partitioning Tool. You will see a list of every drive connected to the computer, usually named like `/dev/sda`, `/dev/sdb`, `/dev/nvme0n1`.

### Step 1: Identify the Drives
Linux names hard drives sequentially.
- **`/dev/nvme0n1`** or **`/dev/sda`**: This is almost always your internal Windows drive. You will see several partitions under it (like `sda1`, `sda2`) that are formatted as `ntfs`. **DO NOT TOUCH THIS DRIVE.**
- **`/dev/sdb`** or **`/dev/sdc`**: Look for the drive that matches the size of your External SSD. If you bought a 500GB SSD, look for the drive that says ~500000 MB. 

### Step 2: Clear the External SSD
1. Select the External SSD (e.g., `/dev/sdb`).
2. If there are any partitions listed *under* it (like `/dev/sdb1`), click on them and click the **Minus (-)** button to delete them.
3. When the entire drive just says **"free space"**, you are ready to begin slicing.

### Step 3: Create the EFI Partition
1. Highlight the "free space" under your External SSD.
2. Click the **Plus (+)** button to create a new partition.
   - **Size:** `500` MB
   - **Type for the new partition:** Primary
   - **Location:** Beginning of this space
   - **Use as:** EFI System Partition
3. Click OK.

### Step 4: Create the Root Partition
1. Highlight the remaining "free space" again. Click **Plus (+)**.
   - **Size:** `100000` MB (which is roughly 100GB. You can go up to 150000 MB if you have a massive 1TB drive).
   - **Type:** Primary
   - **Location:** Beginning of this space
   - **Use as:** Ext4 journaling file system
   - **Mount point:** `/` (Just a single forward slash. This means 'Root').
3. Click OK.

### Step 5: Create the Shared Data Partition
1. Highlight the remaining "free space". Click **Plus (+)**.
   - **Size:** Leave it alone (it will automatically use all remaining space).
   - **Type:** Primary
   - **Use as:** exFAT
   - **Mount point:** Leave blank.
3. Click OK.

### Step 6: The Bootloader Location (CRITICAL)
At the bottom of the screen, there is a dropdown menu called **"Device for boot loader installation"**.
By default, it might select your Windows drive (`/dev/nvme0n1`). 
**CHANGE THIS.** 
Click the dropdown and select the **EFI System Partition** you just created on your external SSD (e.g., `/dev/sdb1`). 
If you forget this step, the Ubuntu bootloader will be installed on your Windows drive, ruining the hardware isolation we worked so hard to achieve.

### Step 7: Commit
Double-check everything. Are you only modifying `/dev/sdb`? Is the bootloader pointing to `/dev/sdb1`? 
If yes, click **Install Now**. A warning will pop up. Click **Continue**. 
The point of no return has passed. You did it correctly.

---

## Screenshots

![Advanced Partitioning Tool Placeholder](assets/images/ubuntu-partitioning-placeholder.png)

*Figure 21.1: The Advanced Partitioning Tool. Notice the three partitions created on /dev/sdb, and the bootloader device at the bottom pointing to the ESP.*

---

## Tips & Warnings

> [!CAUTION]
> If you accidentally delete an NTFS partition on `/dev/nvme0n1` and click Install Now, your Windows OS and all personal files will be permanently destroyed. Always triple-check the drive sizes!

> [!TIP]
> 100GB for the Root (`/`) partition might seem small compared to Windows, but Linux is incredibly efficient. A full Ubuntu installation takes about 10GB. You will have 90GB free for developer tools, which is more than enough for Docker, Node, Android Studio, and databases.

---

## Exercises

1. Memorize the 3 partitions required: EFI (FAT32, 500MB), Root (ext4, 100GB+), Shared (exFAT, Remaining).
2. Memorize the symbol for the Root mount point: `/`

---

## Quiz

**Question 1:** Why do we use the "Something else" option instead of "Install Ubuntu alongside Windows"?
- A) Because the automatic options will modify the internal Windows hard drive, breaking our goal of total hardware isolation.
- B) Because it is faster.
- C) Because Ubuntu cannot detect Windows.

<details>
<summary>Click here for the answer</summary>
**Answer: A**. The automatic options will shrink your internal Windows C: drive. We must use manual partitioning to force the installation entirely onto the External SSD.
</details>

**Question 2:** Where MUST the "Device for boot loader installation" be set?
<details>
<summary>Click here for the answer</summary>
**Answer:** It must be set to the 500MB EFI System Partition that you just created on the External SSD. If you leave it on default, it will overwrite the Windows bootloader on the internal drive.
</details>

---

## Summary

Manual partitioning is the most crucial step of the installation. By creating an EFI partition for the bootloader, an ext4 partition for the OS, and an exFAT partition for shared files, you guarantee a perfect, isolated Portable Developer Workstation.

## Next Chapter

While the installation runs in the background, the installer will ask you a few final questions about timezones and users. We will also explain exactly what a "Bootloader" is doing in the background.

[Go to Chapter 22: Bootloader ➡️](22-bootloader.md)
