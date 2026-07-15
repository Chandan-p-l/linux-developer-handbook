# Chapter 47: Shell Scripting

If you find yourself typing the same five commands into the terminal every single day, you are wasting your time. 

As a developer, your primary goal is to automate repetitive tasks. In Linux, you do this using **Shell Scripting**. 

## Learning Objectives
By the end of this chapter, you will:
- Understand what a Shell Script is.
- Understand the Shebang (`#!/bin/bash`).
- Write your first automation script.
- Understand how to pass variables to a script.

---

## Theory: The Automated Typist

A Shell Script is simply a plain text file containing a list of terminal commands. 

When you run the script, the Bash shell reads the file from top to bottom, and types the commands into the terminal for you, one by one, at lightning speed.

Shell scripting is the foundation of **DevOps** (Developer Operations). Massive companies like Netflix and Amazon use complex shell scripts to automatically configure hundreds of cloud servers simultaneously.

### The Shebang
If you open any file in the `scripts/` folder of this repository, you will notice the very first line is always:
```bash
#!/bin/bash
```
This is called a **Shebang** (Hash-Bang). 
Because Linux does not rely on file extensions (like `.exe` or `.txt`) to know what a file is, the Shebang tells the operating system: *"Hey, use the `/bin/bash` program to read and execute the rest of the text in this file."*

---

## Practical Example: The Backup Script

Let's write a simple script that automatically creates a compressed backup of your coding projects.

### Step 1: Create the file
Open your terminal and use the `nano` text editor to create a new file.
```bash
nano backup.sh
```

### Step 2: Write the code
Type the following lines exactly as they appear:

```bash
#!/bin/bash

# This is a comment. It explains what the code does.
echo "Starting the backup process..."

# Define variables
SOURCE_FOLDER="$HOME/Documents/projects"
DESTINATION_FOLDER="$HOME/backup"
DATE=$(date +%Y-%m-%d)
BACKUP_FILENAME="backup-$DATE.tar.gz"

# Create the destination folder if it doesn't exist
mkdir -p $DESTINATION_FOLDER

# Create the compressed backup using the tar command
tar -czf $DESTINATION_FOLDER/$BACKUP_FILENAME $SOURCE_FOLDER

echo "Backup complete! File saved to $DESTINATION_FOLDER"
```

To save and exit `nano`:
1. Press `Ctrl + O` (Save).
2. Press Enter (Confirm filename).
3. Press `Ctrl + X` (Exit).

### Step 3: Make it Executable
As we learned in Chapter 45, Linux will not allow a text file to run as a program by default for security reasons. We must grant it Execute permission.
```bash
chmod +x backup.sh
```

### Step 4: Run it!
To run a script in your current directory, you must prefix it with `./` (which means "Look in the current folder, not in the global system path").
```bash
./backup.sh
```
Watch the terminal print the output. You just automated your first task!

---

## Tips & Warnings

> [!WARNING]
> Do not use spaces around the equals sign when defining variables in Bash. 
> `NAME="John"` is correct. 
> `NAME = "John"` will crash the script because Bash thinks `NAME` is a command.

> [!TIP]
> You can pass arguments to your script from the terminal. If you run `./script.sh apple orange`, you can access those words inside the script using the variables `$1` (which will equal apple) and `$2` (which will equal orange).

---

## Exercises

1. Create the `backup.sh` script described above.
2. Run it and verify that it actually created a `.tar.gz` compressed file in your newly created `backup` folder.
3. Open the `scripts/update-system.sh` file included in this repository and read the code. You should now understand exactly what it is doing!

---

## Quiz

**Question 1:** What is the purpose of `#!/bin/bash` at the top of a script?
- A) It is a comment for the developer.
- B) It tells the operating system which shell interpreter to use to execute the script.
- C) It makes the file executable.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. The Shebang guarantees that the file is executed by the Bash shell, even if the user is currently using a different shell.
</details>

**Question 2:** How do you execute a script located in your current directory?
<details>
<summary>Click here for the answer</summary>
**Answer:** Prefix the filename with `./` (e.g., `./backup.sh`).
</details>

---

## Summary

Shell scripting is the ultimate tool for avoiding repetitive work. By bundling commands into a text file, adding a Shebang, and granting execute permissions, you can automate incredibly complex server setups, backups, and deployments with a single keystroke.

## Next Chapter

We wrote the backup script, but you still have to remember to type `./backup.sh` every day. What if you could tell the computer to run it automatically at 2:00 AM every single night while you are asleep? Next, we introduce Cron Jobs.

[Go to Chapter 48: Cron Jobs ➡️](48-cron-jobs.md)
