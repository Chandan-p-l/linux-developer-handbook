# Chapter 44: Essential Linux Commands

You can build an entire career in software engineering knowing only about 15 core Linux commands. This chapter will teach you the first 5. These commands replace everything you do in the Windows File Explorer (viewing files, changing folders, creating folders, and moving files).

## Learning Objectives
By the end of this chapter, you will master:
- `pwd` (Print Working Directory)
- `ls` (List)
- `cd` (Change Directory)
- `mkdir` (Make Directory)
- `rm` (Remove)

---

## Theory & Practice: The Big Five

When you open the terminal, you are virtually "standing" inside a specific folder on your hard drive. 

### 1. Where am I? (`pwd`)
If you ever get lost and don't know what folder you are currently standing in, type `pwd` (Print Working Directory).
```bash
user@ubuntu:~$ pwd
/home/user
```

### 2. What is in here? (`ls`)
To look around the room and see all the files and folders in your current location, type `ls` (List).
```bash
user@ubuntu:~$ ls
Desktop  Documents  Downloads  Music  Pictures  Videos
```
**Pro-Tip:** Add the `-l` flag (long format) to see file sizes and permissions: `ls -l`. Add the `-a` flag (all) to see hidden files: `ls -la`.

### 3. How do I move? (`cd`)
To walk into a different folder, use `cd` (Change Directory), followed by the name of the folder you want to enter.
```bash
user@ubuntu:~$ cd Documents
user@ubuntu:~/Documents$ 
```
*Notice how the prompt changed from `~` to `~/Documents` to show your new location.*

**How to go back:** To step backward (up) into the parent folder, you use two dots `..`
```bash
user@ubuntu:~/Documents$ cd ..
user@ubuntu:~$
```

### 4. How do I create a folder? (`mkdir`)
To create a new folder, use `mkdir` (Make Directory).
```bash
user@ubuntu:~$ mkdir my-new-project
```
If you type `ls` again, you will see `my-new-project` in the list!

### 5. How do I delete something? (`rm`)
To delete a file, use `rm` (Remove).
```bash
user@ubuntu:~$ rm unused_file.txt
```

**Deleting Folders:** By default, `rm` only deletes files. It will refuse to delete a folder because the folder might contain other things. To force it to delete a folder and everything inside it, you must use the "recursive" flag `-r`.
```bash
user@ubuntu:~$ rm -r my-new-project
```

---

## Putting it all together (A Workflow)

Read through this sequence to see how a developer navigates their machine entirely via text:

```bash
# Where am I?
user@ubuntu:~$ pwd
/home/user

# I want to go to my Documents
user@ubuntu:~$ cd Documents

# I want to create a folder for my new website
user@ubuntu:~/Documents$ mkdir my-website

# I want to go inside that new folder
user@ubuntu:~/Documents$ cd my-website

# I want to make sure it's empty
user@ubuntu:~/Documents/my-website$ ls
(Nothing prints, because it is empty!)

# Oh wait, I want to go back home
user@ubuntu:~/Documents/my-website$ cd ~
```

---

## Tips & Warnings

> [!WARNING]
> The `rm` command is permanent. It bypasses the Trash Can. If you type `rm -r Documents`, your entire Documents folder is instantly gone forever. Use it with extreme caution.

> [!TIP]
> The `~` (tilde) symbol always represents your Home folder. No matter how deep you are buried in the file system (e.g., `/var/www/html/assets/images`), if you simply type `cd ~` (or just `cd` by itself) and press Enter, you will instantly teleport back to your Home folder.

---

## Exercises

Open your terminal and perform these exact steps:
1. Navigate to your Downloads folder: `cd ~/Downloads`
2. Create a new folder named `junk`: `mkdir junk`
3. Verify it was created by listing the contents: `ls`
4. Delete the folder you just created: `rm -r junk`
5. Go back to your home folder: `cd ~`

---

## Quiz

**Question 1:** If you are inside the folder `/home/user/Music`, what command will take you back to `/home/user`?
- A) `cd back`
- B) `cd ..`
- C) `exit`

<details>
<summary>Click here for the answer</summary>
**Answer: B**. The `..` symbol always represents the parent directory (one step backward).
</details>

**Question 2:** Why must you use `rm -r` instead of just `rm` when deleting a folder?
<details>
<summary>Click here for the answer</summary>
**Answer:** `rm` is designed to delete single files. To delete a folder, you must tell the command to act "recursively" (`-r`) so it deletes the folder and all the files hidden inside it.
</details>

---

## Summary

The terminal replaces the mouse for navigating your computer. `pwd` tells you where you are, `ls` shows you what is around you, `cd` moves you to new locations, `mkdir` creates folders, and `rm` deletes them. Mastering these five commands is the first step to becoming a Linux power user.

## Next Chapter

Now that you can move around and create files, you need to understand who is actually allowed to view or delete them. Next, we will cover the cornerstone of Linux security: File Permissions.

[Go to Chapter 45: File Permissions ➡️](45-file-permissions.md)
