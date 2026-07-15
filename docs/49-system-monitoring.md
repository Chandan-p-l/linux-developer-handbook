# Chapter 49: System Monitoring (`htop`)

In Windows, when your computer freezes or a fan spins out of control, you press `Ctrl + Alt + Delete` to open the Task Manager and kill the offending program.

In a Linux terminal (especially on a cloud VPS with no graphical desktop), you cannot use a mouse to open a Task Manager. You must monitor system resources and kill processes entirely via text. The industry standard tool for this is **htop**.

## Learning Objectives
By the end of this chapter, you will:
- Understand the difference between `top` and `htop`.
- Learn how to read CPU and RAM usage in the terminal.
- Learn how to safely kill a frozen application.

---

## Theory: Processes and PIDs

Every time you open an application (like Chrome, Docker, or VS Code), the Linux kernel creates a **Process**. 

To keep track of everything, the kernel assigns every single process a unique, random number called a **PID (Process ID)**.

If Chrome completely freezes and refuses to close, you don't tell the kernel "Kill Chrome." You look up Chrome's PID (e.g., 4012), and you tell the kernel, "Execute PID 4012."

### `top` vs `htop`
By default, every Linux system comes with a command called `top`. It shows a live, updating list of processes. However, `top` is ugly, difficult to read, and hard to interact with.

Developers prefer an upgraded, colorful version called **`htop`**. It provides visual meters for CPU and RAM usage, and allows you to use your arrow keys to select processes.

---

## Practical Example: Using `htop`

### Step 1: Install `htop`
`htop` is not always installed by default. Install it using the package manager:
```bash
sudo apt update
sudo apt install htop
```

### Step 2: Open the Monitor
To start monitoring your system in real-time, simply type:
```bash
htop
```
The terminal will instantly transform into a colorful, Matrix-like dashboard.

### Step 3: Read the Dashboard
Let's break down the UI:
1. **The Top Left (CPU & RAM):** 
   - You will see numbered bars (`1, 2, 3, 4`). These represent the physical cores of your laptop's CPU. If they are full (100%), your computer is working as hard as possible.
   - Below the CPU cores is `Mem` (Memory/RAM) and `Swp` (Swap space). The bar shows how much of your total RAM is currently being used.
2. **The Top Right (Uptime):** Shows how long the computer has been turned on without a reboot, and the "Load Average" (a complex metric indicating system strain).
3. **The Main List (Processes):** This is the list of every running application, sorted by default by how much CPU they are consuming. 
   - Look for the **PID** column on the far left.
   - Look for the **Command** column on the far right (this tells you what the app actually is).

### Step 4: Kill a Process
Imagine you wrote a Python script that got stuck in an infinite loop and is consuming 100% of CPU Core 1.
1. Use your **Up and Down Arrow keys** to scroll through the list and highlight the frozen Python process.
2. Press `F9` on your keyboard to open the "Kill" menu.
3. The menu on the left will ask what "Signal" to send. The default is `15 (SIGTERM)`, which politely asks the app to save its data and close. 
4. Press **Enter**.
5. If the app is deeply frozen and ignores the polite request, press `F9` again, select `9 (SIGKILL)`, and press Enter. This tells the kernel to instantly terminate the app with extreme prejudice.

### Step 5: Exit
To leave `htop` and return to the normal terminal, press `F10` or the `q` key.

---

## Screenshots

![htop Placeholder](assets/images/htop-placeholder.png)

*Figure 49.1: The htop interface. Notice the visual CPU core bars and the highlighted process row.*

---

## Tips & Warnings

> [!WARNING]
> Do not randomly kill processes owned by `root`. If you kill the wrong background system process (like `systemd`), you will instantly crash the entire Ubuntu operating system, requiring a hard reboot of your laptop.

> [!TIP]
> You can click inside the terminal window! While `htop` is a text-based tool, it supports mouse input. You can click the column headers (like `MEM%`) to instantly sort the list by RAM usage instead of CPU usage.

---

## Exercises

1. Install and run `htop`.
2. Find the CPU and Memory bars. Note how much RAM your system is using while idle.
3. Open Google Chrome, open 5 tabs, and watch `htop`. Notice how Chrome creates dozens of separate processes and eats your RAM.
4. Use the `F10` key to quit.

---

## Quiz

**Question 1:** What does PID stand for?
- A) Personal Identification Data
- B) Process ID
- C) Python Interactive Debugger

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Process ID is the unique numeric identifier the Linux kernel assigns to every running application.
</details>

**Question 2:** Which termination signal should you use to forcefully kill an application that is completely frozen and ignoring normal close requests?
<details>
<summary>Click here for the answer</summary>
**Answer: `9 (SIGKILL)`**.
</details>

---

## Summary

Mastering `htop` gives you x-ray vision into your computer's performance. By understanding how to read CPU/RAM metrics and how to identify and kill rogue processes via their PIDs, you can maintain a stable, high-performance developer workstation (or remote cloud server) without ever relying on a graphical user interface.

## Next Chapter

We have covered installing software, navigating the file system, scripting, and monitoring. But what happens when you need to search through 10,000 files to find a single line of code? Next, we introduce the most powerful text-search tool in the world: `grep`.

[Go to Chapter 50: Grep & Piping ➡️](50-grep.md)
