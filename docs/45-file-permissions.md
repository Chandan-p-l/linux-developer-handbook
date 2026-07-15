# Chapter 45: File Permissions

Linux is inherently a multi-user operating system. It was designed in an era where 50 people might be logged into the same giant mainframe computer simultaneously. 

Because of this, Linux has a paranoid, rock-solid security system baked into every single file on the hard drive. It is called the **Permissions System**.

## Learning Objectives
By the end of this chapter, you will:
- Understand Read, Write, and Execute permissions.
- Understand the difference between User, Group, and Others.
- Learn how to read the output of `ls -l`.
- Learn how to use the `chmod` command to change permissions.

---

## Theory: The Three Actions

In Linux, there are only three things you can possibly do to a file:
1. **Read (r):** You can open the file and look at the text inside it. (Or, if it's a folder, you can look at the list of files inside it).
2. **Write (w):** You can edit the file, save changes to it, or delete it.
3. **Execute (x):** You can run the file as a program or a script.

### The Three Audiences

Every file has a designated Owner (User), and every file belongs to a Group.
Permissions are handed out to three different audiences:
1. **User (u):** The person who created/owns the file.
2. **Group (g):** Other users who belong to the file's group.
3. **Others (o):** The entire rest of the world (anyone else logged into the computer).

---

## Practical Example: Decoding `ls -l`

In the last chapter, we mentioned that running `ls -l` shows you file permissions. Let's look at what that actually means.

Run this in your terminal:
```bash
ls -l /etc/hosts
```

You will see output that looks like this:
```text
-rw-r--r-- 1 root root 221 May 25 10:00 /etc/hosts
```

The crazy string of letters at the beginning (`-rw-r--r--`) is the permission string. It is 10 characters long. Let's break it down:

- **Character 1 (`-`):** This indicates the file type. A `-` means it is a normal file. A `d` means it is a directory (folder).
- **Characters 2,3,4 (`rw-`):** The **User** (Owner) permissions. The owner can Read and Write, but cannot Execute (because there is a `-` instead of an `x`).
- **Characters 5,6,7 (`r--`):** The **Group** permissions. The group can only Read.
- **Characters 8,9,10 (`r--`):** The **Others** permissions. The rest of the world can only Read.

Following the permissions, you see `root root`. This means the User who owns the file is `root`, and the Group that owns it is `root`. 

**Conclusion:** Because you are not the `root` user, you fall into the "Others" category. Therefore, you are allowed to *read* the `/etc/hosts` file, but if you try to save changes to it, the system will throw a "Permission Denied" error.

---

## Changing Permissions (`chmod`)

If you write a bash script (like the ones in the `scripts/` folder of this guide), Linux will not let you run it by default as a safety precaution. It will not have the `Execute (x)` permission.

You must grant it the execute permission using the **Change Mode (`chmod`)** command.

If you have a file named `install.sh`:
```bash
chmod +x install.sh
```
This command means "Add (`+`) the Execute (`x`) permission to this file."
Now, you can run the script by typing `./install.sh`.

You can also remove permissions. If you want to make a file completely read-only so you don't accidentally delete your own code:
```bash
chmod -w important_file.txt
```
*(Removes the Write permission).*

---

## Tips & Warnings

> [!WARNING]
> You might see tutorials on the internet telling you to run `chmod 777 filename` to fix a permission error. **NEVER DO THIS.** `777` is a numeric shortcut that grants Read, Write, and Execute permissions to *everyone in the world*. It is a massive security vulnerability.

> [!TIP]
> If you create a file in your Home folder, you are the Owner, and you have full Read and Write permissions automatically. You only run into permission errors when trying to modify files outside your Home folder (like in `/var/www/html` or `/etc`).

---

## Exercises

1. Create a dummy file in your terminal: `touch secret.txt`
2. Look at its default permissions: `ls -l secret.txt`. Notice you have `rw-` permissions.
3. Remove your own write permission: `chmod -w secret.txt`
4. Look at the permissions again: `ls -l secret.txt`. It should now be `r--`.
5. Try to delete the file: `rm secret.txt`. The terminal will warn you that it is write-protected! (Type `y` to force the deletion).

---

## Quiz

**Question 1:** In the permission string `drwxr-xr-x`, what does the very first `d` stand for?
- A) Delete
- B) Document
- C) Directory (Folder)

<details>
<summary>Click here for the answer</summary>
**Answer: C**. The first character indicates the file type. `d` means directory, `-` means regular file.
</details>

**Question 2:** Why must you run `chmod +x` on a shell script before you can use it?
<details>
<summary>Click here for the answer</summary>
**Answer:** By default, Linux creates text files without the Execute (`x`) permission to prevent malicious code from running automatically. You must explicitly grant execution rights.
</details>

---

## Summary

File permissions are the bedrock of Linux security. Every file defines exactly who is allowed to Read, Write, or Execute it. By understanding how to read `ls -l` outputs and modify permissions using `chmod`, you gain complete control over your files and learn how to secure your applications.

## Next Chapter

We've mentioned it several times throughout this guide, but now it is time to fully understand the software distribution system that makes Linux superior to Windows: The Package Manager.

[Go to Chapter 46: Package Manager ➡️](46-package-manager.md)
