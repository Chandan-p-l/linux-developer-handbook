# Chapter 55: Maintenance

You have built a high-performance, isolated Linux developer workstation on an external SSD. It is fast, secure, and packed with industry-standard tools. 

But a workstation is like a car. If you do not perform regular maintenance, it will eventually break down, run out of space, or become vulnerable to security threats. This chapter outlines the weekly and monthly habits of a professional Linux user.

## Learning Objectives
By the end of this chapter, you will:
- Establish a routine for system updates.
- Learn how to clean up the `apt` package cache.
- Learn how to clean up massive, unused Docker images.
- Understand the importance of the `optimize.sh` script.

---

## Theory: The Entropy of an OS

Over time, operating systems accumulate junk. 
- When you update software, `apt` keeps the old installation files on your hard drive "just in case." 
- When you experiment with Docker, every container you run downloads a massive Image file (like a 1GB Ubuntu image or a 500MB Postgres image). 
- When you install NVM, you might forget to delete older versions of Node.js.

If you have a massive 1TB SSD, you might not notice this for years. If you bought a small 256GB SSD, your Root (`/`) partition will fill up rapidly, and Ubuntu will eventually crash when it runs out of space.

---

## Practical Example: The Maintenance Routine

Here is the exact routine you should run at least once a month (or automate via a Cron job!).

### 1. Update the System
Always keep your software secure.
```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Clean APT Cache
This command tells the package manager to delete all old, unnecessary installer files and orphaned dependencies that were left behind after upgrades.
```bash
sudo apt autoremove -y && sudo apt clean
```

### 3. Clean Docker
Docker is the biggest space-hog on any developer machine. Every time you pull a new image, it sits on your hard drive forever, even if you delete the container.

Docker has a built-in command to annihilate all stopped containers, unused networks, and dangling images instantly:
```bash
docker system prune -a
```
*(The terminal will ask `Are you sure? [y/N]`. Type `y`. You might be shocked to see it free up 10GB or 20GB of space!)*

### 4. Trim the SSD
Unlike old spinning hard drives that need "Defragmentation," modern SSDs need a process called **TRIM**. TRIM tells the SSD controller which blocks of data are no longer considered in use, allowing the SSD to wipe them internally and maintain its lightning-fast write speeds.

Ubuntu usually does this automatically once a week, but you can force it manually:
```bash
sudo fstrim -av
```

---

## The Automated Solution

Because developers hate doing things manually, we provided a script that does all of this for you!

Open your terminal and run:
```bash
cd ~/Documents/ubuntu-external-ssd-guide/scripts
./optimize.sh
```
*(Remember, if it says permission denied, run `chmod +x optimize.sh` first).*

This script will run the updates, clean `apt`, prune Docker, and trim the SSD all at once.

---

## Tips & Warnings

> [!WARNING]
> The `docker system prune -a` command will delete ALL images that are not currently attached to a running container. This means the next time you try to run your MySQL container, Docker will have to spend 60 seconds re-downloading the MySQL image from the internet. This is a small price to pay for freeing up massive amounts of storage space.

> [!TIP]
> If you are running out of space and don't know why, you can use the `ncdu` (NCurses Disk Usage) tool. Install it with `sudo apt install ncdu`. Then, type `ncdu /` in the terminal. It provides a brilliant, terminal-based visual breakdown of exactly which folders are consuming the most space on your hard drive!

---

## Exercises

1. Run the four manual maintenance commands listed above. Note how much space `docker system prune -a` freed up.
2. Install `ncdu` and explore your hard drive's storage usage.
3. Open the `scripts/optimize.sh` file using `nano` and read the code. You will see it is just a collection of the exact commands we covered.

---

## Quiz

**Question 1:** Why should you run `apt autoremove` periodically?
- A) To uninstall your operating system.
- B) To remove old dependencies and leftover installation files that are no longer needed, freeing up SSD space.
- C) To make the terminal run faster.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. It is a safe, easy way to keep the Linux file system clean.
</details>

**Question 2:** What Docker command aggressively deletes all stopped containers and unused images?
<details>
<summary>Click here for the answer</summary>
**Answer: `docker system prune -a`**.
</details>

---

## Summary

A professional does not wait for their tools to break. By executing a regular maintenance routine—updating software, cleaning the package cache, pruning Docker, and trimming the SSD—you guarantee that your portable workstation will remain fast and reliable for years. 

## Next Chapter

You have reached the end of the journey. The final chapter offers a summary of everything you have accomplished, a roadmap for the future, and congratulations.

[Go to Chapter 56: Conclusion ➡️](56-conclusion.md)
