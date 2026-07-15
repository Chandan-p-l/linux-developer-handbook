# Chapter 13: Download Ubuntu

The theory is complete. It is time to begin building your Portable Developer Workstation. The very first step is acquiring the Ubuntu operating system.

When you install Windows, you usually buy a computer that already has it, or you buy a physical DVD/USB from a store. Linux is different. It is free, and you download it directly from the internet.

## Learning Objectives
By the end of this chapter, you will:
- Know where to download the official Ubuntu operating system.
- Understand what an `.iso` file is.
- Know the difference between LTS and Interim releases.

---

## What is an ISO File?

When you download Ubuntu, you will be downloading a single, massive file ending in `.iso`.

An **ISO file** is an exact, sector-by-sector digital replica of an optical disc (like a CD or DVD). 
In the 2000s, you would download this file, use a DVD burner to burn it onto a physical blank DVD, and then put that DVD into your computer to install Linux.

Because modern laptops do not have DVD drives, we don't burn the ISO to a disc anymore. Instead, in Chapter 15, we will use a special software to "burn" this ISO file onto your small USB Flash Drive, tricking the computer into thinking the USB drive is a DVD.

---

## Step-by-Step: Downloading Ubuntu

We are going to download the **Ubuntu Desktop** version. 

1. Open your web browser on Windows and go to the official Ubuntu website: [https://ubuntu.com/download/desktop](https://ubuntu.com/download/desktop)
2. You will see two main options. For example:
   - Ubuntu **24.04 LTS**
   - Ubuntu **24.10**
3. **CRITICAL:** Always click the **Download** button next to the version that has **LTS** (Long Term Support) in the name. 
4. The download will begin. It is a large file (usually between 3GB and 5GB), so it may take several minutes depending on your internet connection.

### LTS vs Interim Releases

Why did we choose the LTS version?
- **LTS (Long Term Support):** Released every two years in April. It is guaranteed to receive security updates, bug fixes, and hardware support for **5 years**. This is the rock-solid, production-ready version that businesses use. If you want to learn to code without your operating system randomly breaking, you must use LTS.
- **Interim Releases:** Released every six months (like 24.10). These only receive support for 9 months. They are testing grounds for new features. If you are a beginner, avoid these.

---

## Screenshots

![Ubuntu Download Page Placeholder](assets/images/ubuntu-download-placeholder.png)

*Figure 13.1: The official Ubuntu download page. Notice the prominent LTS button.*

---

## Tips & Warnings

> [!WARNING]
> Only download Ubuntu from the official `ubuntu.com` website. Never download operating systems from third-party torrent sites or mirror links unless you are absolutely sure of their authenticity, as they could be modified to contain malware.

> [!TIP]
> Do not try to double-click or "open" the `.iso` file in Windows after it downloads. Windows might try to mount it as a virtual DVD drive, which is not what we want. Just leave it sitting in your `Downloads` folder.

---

## Exercises

1. Navigate to `ubuntu.com/download/desktop` and start the download for the latest LTS version.
2. While it is downloading, check your Windows `Downloads` folder. Look at the file extension. If you can't see `.iso`, you may need to go to the "View" tab in Windows Explorer and check the box for "File name extensions".

---

## Quiz

**Question 1:** What is an ISO file?
- A) A text document containing the Linux source code.
- B) A single archive file containing an exact replica of the data on an optical disc.
- C) A Windows executable installer.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. An ISO file is a disk image that we will later write to a USB drive.
</details>

**Question 2:** Which version of Ubuntu should a beginner developer install?
<details>
<summary>Click here for the answer</summary>
**Answer: The LTS (Long Term Support) version**. It provides 5 years of stability and security updates.
</details>

---

## Summary

To install Linux, you must first download it as a disk image file called an ISO. You should always download the LTS (Long Term Support) version directly from the official Ubuntu website to guarantee stability and security for your developer workstation.

## Next Chapter

Before we put this ISO file onto a USB drive, how do we know it didn't get corrupted during the massive 5GB download? In the next chapter, we will learn how to mathematically verify the integrity of the file we just downloaded.

[Go to Chapter 14: Verify Download ➡️](14-verify-download.md)
