# Chapter 7: Hardware

Before we download any software, you need to ensure you have the correct physical hardware. A poor hardware choice (like using a cheap USB thumb drive) will ruin your experience and make Linux feel slow and unusable.

## Learning Objectives
By the end of this chapter, you will:
- Know exactly what hardware you need to purchase or find.
- Understand the difference between a Flash Drive and an SSD.
- Learn about the different types of USB ports and how they affect speed.

---

## Theory: The Required Equipment

To follow this guide and build your Portable Developer Workstation, you will need **three** pieces of hardware:

1. **A Windows PC or Laptop** (The host machine)
2. **An External SSD** (The destination for Ubuntu)
3. **A small USB Flash Drive** (The installation tool)

### 1. The Host Machine
You need a computer that is currently running Windows. It must have a 64-bit processor (almost every computer made after 2010 has one). 

Crucially, you need to identify the fastest USB port on this computer. 
- **USB 2.0:** (Usually black inside) - Too slow. Do not use.
- **USB 3.0 / 3.1 / 3.2:** (Usually blue inside, or labeled 'SS') - Excellent.
- **USB-C:** (The small, reversible oval port) - Best option. Blistering fast.

### 2. The External SSD (The Destination)
This is where Ubuntu will live forever. You need a real Solid State Drive.

**Why not a cheap Flash Drive?**
Flash drives (thumb drives) are designed for storing files and occasionally reading them. They lack a "memory controller" to handle the thousands of tiny, simultaneous read/write requests that an operating system constantly makes. If you install Ubuntu on a flash drive, the system will freeze constantly, the drive will overheat, and it will physically die within months.

**Recommendations:**
- **Capacity:** Minimum 256GB. (500GB or 1TB is ideal if you plan to install Docker, large databases, or large code repositories).
- **Models:** 
  - Samsung T7 Shield (Excellent, highly durable)
  - SanDisk Extreme Portable SSD
  - Crucial X8 or X9

*Budget Alternative:* If you want to save money, buy an internal 2.5" SATA SSD (like a Crucial MX500) and put it inside a cheap $10 "2.5-inch USB Hard Drive Enclosure". 

### 3. The Small USB Flash Drive (The Installer)
You need a standard USB thumb drive. We will only use this drive once, as a temporary tool to install Ubuntu onto the SSD.
- **Capacity:** Minimum 8GB.
- **Speed:** Doesn't matter. It will just hold the installer files.
- **Warning:** Everything currently on this small drive will be permanently erased. Back up its contents!

---

## Practical Example: Visualizing the Setup

Imagine your desk. 

In front of you is your Windows Laptop.
Plugged into the left side of your laptop (into a standard USB port) is the small 8GB Flash Drive.
Plugged into the right side of your laptop (into a fast USB-C or blue USB 3.0 port) is the Samsung T7 External SSD.

When we boot the computer later, we will tell the computer to boot from the small Flash Drive (the installer). The installer will run, and we will tell it to install Ubuntu onto the Samsung T7 (the destination).

---

## Tips & Warnings

> [!WARNING]
> Do NOT buy a mechanical "External Hard Drive" (HDD). These are the thicker, heavier drives that spin inside. They are too slow for a modern operating system. It must say "SSD" on the box.

> [!TIP]
> If you are buying a new SSD, it will probably come formatted for Windows or Mac. Don't worry about formatting it right now; the Ubuntu installer will handle all formatting automatically in Chapter 21.

---

## Exercises

1. Locate the fastest USB port on your computer. If you have a desktop PC, the fastest ports are usually on the *back* of the machine, plugged directly into the motherboard, rather than the top or front panel.
2. Find an old USB Flash drive (at least 8GB) around your house. Copy any important photos or documents off it, because we are going to erase it completely in Chapter 17.

---

## Quiz

**Question 1:** Why is a standard USB flash drive unacceptable for running an operating system?
- A) It doesn't hold enough data.
- B) It lacks a memory controller and will overheat and die from OS read/write cycles.
- C) It isn't compatible with Linux.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Flash drives are for data storage, not constant system read/writes. You must use an SSD.
</details>

**Question 2:** What is the purpose of the small (8GB+) USB flash drive in this guide?
<details>
<summary>Click here for the answer</summary>
**Answer:** It acts as a temporary installation tool. We boot from it once to install the operating system onto the larger external SSD.
</details>

---

## Summary

To build a portable developer workstation, you need a Windows host machine, a high-quality external SSD (256GB+) to hold the operating system, and a small, temporary USB flash drive (8GB+) to act as the installer. Identifying your fastest USB ports is critical for a smooth, lag-free experience.

## Next Chapter

Now that we know the physical hardware, we need to understand how data is stored on that hardware. In the next chapter, we will explain storage concepts like Partitions, so you don't accidentally delete Windows later.

[Go to Chapter 8: Storage ➡️](08-storage.md)
