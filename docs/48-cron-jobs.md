# Chapter 48: Cron Jobs

In the previous chapter, we wrote a shell script to automate our backups. But true automation means you don't even have to press a button. 

To make your computer execute scripts on a strict time schedule, Linux uses a powerful, ancient time-based job scheduler called **Cron**.

## Learning Objectives
By the end of this chapter, you will:
- Understand what the Cron daemon is.
- Learn how to read Cron syntax (the 5 asterisks).
- Edit your `crontab` to schedule your backup script.

---

## Theory: The Timekeeper

Deep inside your Ubuntu operating system, there is a background program running 24/7 called `crond` (the Cron daemon). 

Every 60 seconds, `crond` wakes up, checks a text file called a **Crontab** (Cron Table), and asks: *"Is there any command scheduled to run at this exact minute?"*

If the answer is yes, it executes the command silently in the background.

### The Cron Syntax
The most confusing part for beginners is how Cron understands time. It uses a 5-part syntax separated by spaces. 

```text
* * * * * command_to_run
| | | | |
| | | | +---- Day of the week (0 - 7) (Sunday is both 0 and 7)
| | | +------ Month (1 - 12)
| | +-------- Day of the month (1 - 31)
| +---------- Hour (0 - 23)
+------------ Minute (0 - 59)
```

An asterisk (`*`) means "Every".

**Examples:**
- `* * * * *` = Run every single minute, forever.
- `0 * * * *` = Run at minute 0 of every hour (Once an hour).
- `30 2 * * *` = Run at 2:30 AM every single day.
- `0 0 * * 1` = Run at midnight on Monday.

*(Pro-Tip: Bookmark the website `crontab.guru`. It allows you to visually test and translate cron syntax into English).*

---

## Practical Example: Scheduling the Backup

Let's tell Cron to run the `backup.sh` script we created in Chapter 47 every day at 3:00 AM.

### Step 1: Open the Crontab Editor
Open your terminal and type:
```bash
crontab -e
```
*(The `-e` stands for edit).*
If this is your first time running the command, it might ask you to choose an editor. Press `1` for `nano`.

### Step 2: Add the Job
You will see a large text file filled with comments (lines starting with `#`). Scroll to the very bottom of the file using your arrow keys.

Add this exact line to the bottom (replace `user` with your actual username):
```text
0 3 * * * /home/user/backup.sh
```

**CRITICAL NOTE:** Notice that we used the full, absolute path to the script (`/home/user/backup.sh`). Cron runs in a blank background environment. It does not know what directory you are in. It does not know where `~` is. You must *always* use full, absolute paths inside a crontab.

### Step 3: Save and Exit
If you are using `nano`:
1. Press `Ctrl + O` (Save).
2. Press Enter.
3. Press `Ctrl + X` (Exit).

The terminal should print: `crontab: installing new crontab`.

Your backup will now run silently every single night at 3:00 AM, assuming your computer is turned on.

---

## Tips & Warnings

> [!WARNING]
> Because Cron jobs run invisibly in the background, if your script throws an error, you won't see it on your screen. Professional developers always add output logging to their cron jobs. Example: `0 3 * * * /home/user/backup.sh >> /home/user/backup_log.txt 2>&1` (This captures all errors and saves them to a text file).

> [!TIP]
> To quickly view a list of all your scheduled jobs without opening the editor, type `crontab -l` (list).

---

## Exercises

1. Visit `crontab.guru` in your web browser and practice writing the syntax for "Every Friday at 5:00 PM".
2. Open your crontab using `crontab -e` and add a test job that creates a file every minute:
   `* * * * * touch /tmp/cron-test.txt`
3. Wait one minute, then check the `/tmp` directory using `ls /tmp`. Did the file appear automatically?

---

## Quiz

**Question 1:** In the Cron syntax `0 12 * * *`, when does the command execute?
- A) Every 12 minutes.
- B) At 12:00 PM (Noon) every day.
- C) Only in December.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Minute 0, Hour 12, every day, every month.
</details>

**Question 2:** Why is it mandatory to use absolute file paths (like `/home/user/script.sh`) inside a Crontab?
<details>
<summary>Click here for the answer</summary>
**Answer:** Because Cron executes commands in a minimal, background environment that lacks the environmental variables and context of a normal user terminal session.
</details>

---

## Summary

Cron is the ultimate tool for hands-off automation. By understanding the 5-star time syntax and managing your `crontab`, you can instruct your Linux system to perform maintenance, run backups, and execute data-scraping scripts completely autonomously.

## Next Chapter

You are running complex Docker databases, Node servers, and background Cron jobs. How do you know if your computer has enough RAM to handle it all? In the next chapter, we will learn how to monitor system resources using the terminal.

[Go to Chapter 49: System Monitoring ➡️](49-system-monitoring.md)
