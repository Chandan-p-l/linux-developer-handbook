# Chapter 8: Storage Concepts

Before we download Ubuntu and begin the installation process, we need to cover the most critical concept in this guide: **Storage Partitions**. 

Understanding how hard drives manage data is the only way to ensure that your Windows installation remains 100% safe when we install Linux. 

## Learning Objectives
By the end of this chapter, you will:
- Understand what a Disk Partition is.
- Understand the concept of "Unallocated Space."
- Know how to identify your Windows drive vs your External SSD.

---

## Theory: Slicing the Pie

Imagine a brand new, empty hard drive as a large, uncut pie. 

You cannot put data onto a raw drive. Before an operating system can save files to it, the drive must be sliced into sections. These slices are called **Partitions**.

### What is a Partition?

A partition is a logically separated section of a physical hard drive. 
Even though you only have one physical metal box (the hard drive), your computer can treat different partitions as completely separate drives.

For example, when you open "My Computer" in Windows, you might see a `C:\` drive and a `D:\` drive. They might actually just be two partitions on the exact same physical drive!

### Why do we Partition?

We partition drives to keep data organized and safe. 
- Windows needs a small partition just to hold boot files.
- Windows needs a large partition to hold the OS and your files (`C:\`).
- PC manufacturers often create a hidden "Recovery Partition" to restore your PC if it breaks.

### Unallocated Space

If you have a 500GB hard drive, but you only create one 300GB partition, what happens to the remaining 200GB?
It becomes **Unallocated Space**. This is raw, empty, invisible space. Operating systems cannot see it, and you cannot save files to it. It is just waiting to be formatted into a new partition.

---

## Practical Example: Viewing your Partitions in Windows

Windows has a built-in tool that lets you see exactly how your drives are sliced up. Let's look at it right now.

1. Right-click the **Start Button** in Windows.
2. Click **Disk Management**.

A window will open showing all the physical drives connected to your computer (Disk 0, Disk 1, etc.).

Look at **Disk 0** (which is usually your internal Windows drive). You will likely see something like this:
- **EFI System Partition** (100 MB) - *This tells the computer how to boot.*
- **Windows (C:)** (475 GB) - *This is where Windows and all your files live.*
- **Recovery Partition** (500 MB) - *Used for Windows repair.*

All three of these slices exist on one physical drive.

![Windows Disk Management Placeholder](assets/images/disk-management-placeholder.png)

*Figure 8.1: The Windows Disk Management tool showing partitions.*

---

## Tips & Warnings

> [!IMPORTANT]
> **The Golden Rule:** When we install Ubuntu later, you will see a screen asking where to install it. You must select the External SSD. **NEVER touch the drive that contains your Windows partitions.** If you delete the Windows (C:) partition, Windows is gone forever.

> [!TIP]
> The easiest way to identify drives is by their **Size**. If your internal laptop drive is 1TB, and your external SSD is 500GB, it will be incredibly obvious which drive is which during the Linux installation menu. 

---

## Exercises

1. Open **Disk Management** in Windows (Right-click Start -> Disk Management).
2. Note the total capacity of **Disk 0**. Is it 256GB? 512GB? 1TB? 
3. Look at how many partitions exist on Disk 0. You will realize Windows is much more complex than just a "C: Drive".
4. If you have your new External SSD, plug it in. Watch it appear in Disk Management as "Disk 1". Unplug it, and watch it disappear. This is exactly how you will identify it later.

---

## Quiz

**Question 1:** What is a partition?
- A) A physical barrier inside the hard drive.
- B) A logically separated section of a physical drive that acts as an independent volume.
- C) A type of file system used by Linux.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. A partition is a software-defined slice of your physical hard drive.
</details>

**Question 2:** What is "Unallocated Space"?
<details>
<summary>Click here for the answer</summary>
**Answer:** It is raw, unformatted space on a hard drive that does not belong to any partition. You cannot save files to it until it is formatted.
</details>

---

## Summary

Hard drives must be sliced into **Partitions** before they can hold data. Your internal Windows drive actually consists of several small partitions working together. By understanding this, you can confidently navigate the Linux installer later and ensure you only create partitions on your External SSD, leaving Windows entirely safe.

## Next Chapter

We know how drives are sliced, but how is the data actually written inside those slices? In the next chapter, we will discuss File Systems, and why Windows can't read Linux files out of the box.

[Go to Chapter 9: File Systems ➡️](09-file-systems.md)
