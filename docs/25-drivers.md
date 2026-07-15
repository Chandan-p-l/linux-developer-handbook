# Chapter 25: Hardware Drivers

Unlike Windows, where you often have to go to a manufacturer's website (like Dell or HP) to download drivers for your Wi-Fi card, Bluetooth, or trackpad, Linux handles drivers very differently. 

This chapter explains how Linux manages hardware and how to ensure your system is running optimally, especially if you have a dedicated graphics card.

## Learning Objectives
By the end of this chapter, you will:
- Understand how the Linux kernel includes open-source drivers by default.
- Know the difference between Open-Source and Proprietary drivers.
- Learn how to use the "Additional Drivers" utility in Ubuntu.

---

## Theory: The Kernel Does the Heavy Lifting

When you installed Windows, you might remember the screen looking low-resolution until you installed the Intel or Nvidia graphics drivers. 

Linux is different. The **Linux Kernel** itself contains tens of thousands of open-source drivers baked directly into it. When you plug in a mouse, a printer, a webcam, or an external hard drive, it almost always works instantly. 

### Open-Source vs Proprietary Drivers

1. **Open-Source Drivers:** These are written by the Linux community or companies like Intel and AMD who openly share their code. They are built into the kernel. They are secure, stable, and work out of the box.
2. **Proprietary (Closed-Source) Drivers:** These are written by companies (like Nvidia or Broadcom) who refuse to share their source code. Because the code is secret, it cannot be baked into the Linux kernel.

**The Nvidia Problem:**
If your laptop has an Nvidia graphics card, the open-source driver (called `nouveau`) will be used by default. It works fine for displaying the desktop, but it is terrible for 3D rendering, machine learning, or gaming. To get full performance from an Nvidia card, you *must* install Nvidia's proprietary, closed-source driver.

If you checked the box during installation (Chapter 20) for "Install third-party software", Ubuntu probably already downloaded and installed the proprietary drivers for you. Let's verify that.

---

## Practical Example: The "Additional Drivers" Utility

Ubuntu includes a fantastic GUI tool for managing proprietary drivers.

1. Click the **Show Applications** button (the 9 dots on the dock).
2. Type `Drivers` and open the app called **Software & Updates**.
3. Click on the **Additional Drivers** tab at the top.

The tool will scan your hardware for a few seconds.

### What to Look For:
- If the screen says "No additional drivers available", congratulations! Your laptop is using 100% open-source drivers built into the kernel. You don't need to do anything.
- If you see your **Nvidia Corporation** graphics card listed, look at the radio buttons below it.
  - One option will say: `Using X.Org X server - Nouveau display driver (open source)`.
  - The other options will say: `Using NVIDIA driver metapackage from nvidia-driver-535 (proprietary, tested)`.

### Changing the Driver
If your Nvidia card is using the open-source Nouveau driver, change it!
1. Select the radio button for the proprietary Nvidia driver (choose the one marked `tested`).
2. Click **Apply Changes** at the bottom right.
3. Wait for the green progress bar to finish (it may take a few minutes as it downloads the driver).
4. **Restart your computer.**

When you reboot, your graphics card will be running at 100% performance, ready for AI development or graphics rendering.

---

## Screenshots

![Additional Drivers Placeholder](assets/images/ubuntu-drivers-placeholder.png)

*Figure 25.1: The Additional Drivers tab in Ubuntu, showing the proprietary Nvidia driver selected over the open-source alternative.*

---

## Tips & Warnings

> [!WARNING]
> Do NOT go to the Nvidia website and download the `.run` driver file for Linux. Installing drivers manually from the website usually breaks the Ubuntu graphical interface, resulting in a black screen. Always use the "Additional Drivers" GUI tool.

> [!TIP]
> If your Wi-Fi is not working at all, it is likely because you have a Broadcom Wi-Fi chip that requires proprietary drivers, but you didn't have internet during installation to download them. The easiest fix is to temporarily plug your phone into the computer via USB and use "USB Tethering" to share your phone's internet, then open the Additional Drivers app to download the Wi-Fi driver.

---

## Exercises

1. Open the "Software & Updates" app and check the "Additional Drivers" tab. 
2. Determine if your computer relies on any proprietary drivers.
3. If you have an Intel or AMD graphics card, notice that it probably doesn't appear in this list. This is because Intel and AMD provide excellent open-source drivers directly to the Linux kernel.

---

## Quiz

**Question 1:** Why is it usually a bad idea to download graphics drivers directly from the manufacturer's website in Linux?
- A) They are too expensive.
- B) They often conflict with the package manager and can break the graphical desktop. You should always use the built-in "Additional Drivers" utility.
- C) The website is usually down.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Linux relies on central package managers. Circumventing them by installing raw `.run` files from websites is a common way beginners break their systems.
</details>

**Question 2:** If the "Additional Drivers" tab is completely empty, what does it mean?
<details>
<summary>Click here for the answer</summary>
**Answer:** It means all the hardware in your laptop is perfectly supported by the open-source drivers built directly into the Linux kernel. No proprietary software is needed.
</details>

---

## Summary

Hardware drivers in Linux are mostly built into the kernel, providing a seamless plug-and-play experience. However, for specific hardware like Nvidia graphics cards or certain Wi-Fi chips, proprietary drivers are required. Ubuntu's "Additional Drivers" tool makes managing these exceptions incredibly easy and safe.

## Next Chapter

The system is updated, the drivers are installed, and the hardware is running perfectly. It is time to start installing actual software. We will begin with the most important tool for any developer: The Web Browser.

[Go to Chapter 26: Google Chrome ➡️](26-google-chrome.md)
