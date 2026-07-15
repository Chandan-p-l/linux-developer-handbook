# Chapter 10: BIOS

When you press the power button on your computer, what happens before Windows loads? The screen is black, maybe a manufacturer logo appears (like Dell, Lenovo, or ASUS), and then Windows suddenly starts. 

That brief gap between pressing the power button and Windows starting is controlled by a piece of software called the **BIOS**. Understanding the BIOS is mandatory if you want to run an operating system from a USB drive.

## Learning Objectives
By the end of this chapter, you will:
- Understand what the BIOS is and what its job is.
- Understand the POST (Power-On Self-Test) process.
- Learn why the BIOS is becoming obsolete.

---

## Theory: The First Awakener

**BIOS** stands for **Basic Input/Output System**.

It is a tiny piece of software permanently etched into a memory chip on your computer's motherboard. 

When your computer is completely turned off, the RAM is empty, the CPU is asleep, and the hard drive is inactive. Windows is trapped inside the hard drive, unable to start itself. 

When you press the power button, the **BIOS** wakes up first.

### The Job of the BIOS

The BIOS has two primary jobs:

#### 1. POST (Power-On Self-Test)
The BIOS checks to make sure the computer isn't broken. It sends electrical signals to the RAM, the keyboard, the mouse, and the hard drive. 
- Are you plugged in? Yes.
- Is there memory? Yes.
- Is the keyboard working? Yes.
If a critical component is missing (like RAM), the BIOS will halt the boot process and make your computer beep aggressively. This is the POST phase.

#### 2. The Bootloader Handoff
Once the BIOS confirms the hardware is healthy, its final job is to find an Operating System.
It looks at the first sector of your hard drive, finds a tiny piece of code called the "Bootloader," and says: *"I'm done testing the hardware. Here are the keys to the car. You take over now."*
The bootloader then wakes up Windows (or Linux), and the BIOS goes to sleep.

### The BIOS Limitation

The original BIOS system was invented in the 1980s by IBM. It was incredible for its time, but as computers evolved over the next 30 years, the BIOS became a massive bottleneck.

- It could only run in 16-bit mode (incredibly slow).
- It could only use 1MB of memory.
- It had no graphical interface; it was just an ugly, blue-and-white text screen.
- **The Fatal Flaw:** It could not boot from a hard drive larger than 2 Terabytes. 

By the early 2010s, hard drives were becoming much larger than 2TB, and computers were booting much faster. The ancient BIOS system was holding modern computers back. 

It was time for a replacement.

---

## Practical Example: The Old Blue Screen

If you used a computer in the 1990s or 2000s, you might remember pressing the `Delete` or `F2` key repeatedly when the computer turned on. 

This would pause the boot process and open the BIOS settings menu. It looked like this:

![Legacy BIOS Placeholder](assets/images/legacy-bios-placeholder.png)

*Figure 10.1: A classic, text-only Legacy BIOS interface.*

You could only navigate this menu using the arrow keys on your keyboard; the mouse did not work. This is where you would change the "Boot Order" to tell the computer to load a CD-ROM before loading the hard drive.

---

## Tips & Warnings

> [!NOTE]
> Even though modern computers no longer use the old 1980s BIOS system, people still colloquially refer to the motherboard settings menu as "The BIOS". When a modern tutorial tells you to "Enter the BIOS," they actually mean its modern replacement (which we will cover in the next chapter).

> [!WARNING]
> Modifying settings in the motherboard firmware can break your computer's ability to boot. Never change voltages or CPU frequencies (overclocking) unless you know exactly what you are doing.

---

## Exercises

1. The next time you turn your computer on from a completely powered-off state, watch the screen carefully. The very first logo you see (Dell, HP, ASUS, Acer) is the motherboard firmware taking control before Windows loads.
2. Note that this process takes only a few seconds today. In the 1990s, the POST process could take a full minute as the BIOS painstakingly counted every megabyte of RAM.

---

## Quiz

**Question 1:** What does POST stand for, and what does it do?
- A) Power-On Self-Test; it checks the hardware for errors before loading the OS.
- B) Pre-Operating System Task; it loads the internet drivers.
- C) Partition Output Status Test; it checks the hard drive format.

<details>
<summary>Click here for the answer</summary>
**Answer: A**. The Power-On Self-Test checks the RAM, CPU, and peripherals to ensure the computer is healthy enough to boot.
</details>

**Question 2:** Why did the original BIOS system become obsolete?
<details>
<summary>Click here for the answer</summary>
**Answer:** It was limited to 16-bit mode, was incredibly slow, had a text-only interface, and crucially, could not boot from hard drives larger than 2 Terabytes.
</details>

---

## Summary

The BIOS is the first software that runs when you turn on your computer. It tests the hardware (POST) and hands control over to the operating system's bootloader. While revolutionary in the 1980s, it became too slow and limited for modern hardware.

## Next Chapter

If the BIOS is obsolete, what replaced it? In the next chapter, we will discuss the system that actually runs on your modern PC: UEFI.

[Go to Chapter 11: UEFI ➡️](11-uefi.md)
