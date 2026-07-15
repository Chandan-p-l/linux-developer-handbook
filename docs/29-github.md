# Chapter 29: GitHub

In the last chapter, we installed Git, which tracks your code locally on your external SSD. But what if your SSD breaks? What if you want to collaborate with a friend across the country? You need a remote server to store your Git repositories.

Enter **GitHub**.

## Learning Objectives
By the end of this chapter, you will:
- Understand the difference between Git and GitHub.
- Learn how to authenticate your Ubuntu machine with GitHub using SSH keys.
- Understand the basic `push` and `pull` workflow.

---

## Theory: The Cloud for Code

A very common beginner mistake is confusing Git and GitHub.
- **Git** is the software running on your computer. It creates the time-machine snapshots (commits).
- **GitHub** is a website (owned by Microsoft) that hosts Git repositories in the cloud. 

When you finish a coding session on your laptop, you take your local Git commits and **Push** them up to GitHub. 
If your friend wants to help, they **Pull** your code down from GitHub, make their changes, commit them locally with Git, and **Push** them back up.

### Authentication

Because your code might be private or proprietary, GitHub needs to know that the person pushing code from your Ubuntu terminal is actually you.

Historically, you would type your username and password into the terminal every time you pushed code. Today, passwords have been disabled for security reasons. You must use an **SSH Key**.

An SSH Key is a pair of cryptographic files generated on your computer. 
- The **Private Key** stays hidden on your Ubuntu SSD.
- The **Public Key** is uploaded to your GitHub account settings.

When your terminal tries to talk to GitHub, they use complex math to verify that the private key perfectly matches the public key, logging you in automatically and securely without ever typing a password.

---

## Practical Example: Generating an SSH Key

Let's authenticate your new Portable Developer Workstation with GitHub.

### Step 1: Create a GitHub Account
If you don't have one, go to `github.com` and create a free account. Use the exact same email address you used in Chapter 28 when configuring Git.

### Step 2: Generate the Key
Open your Ubuntu Terminal and type this command (replace the email with your actual GitHub email):
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
1. It will ask where to save the file. Just press **Enter** to accept the default location (`/home/user/.ssh/id_ed25519`).
2. It will ask for a passphrase. You can press **Enter** twice to leave it empty (easier for beginners), or enter a password for extreme security.

### Step 3: Copy the Public Key
Your computer just created two files. We need to copy the contents of the *Public* file to our clipboard. Run this command to print the file to the terminal:
```bash
cat ~/.ssh/id_ed25519.pub
```
Highlight the output text (it will start with `ssh-ed25519` and end with your email) and right-click -> **Copy**.

### Step 4: Add to GitHub
1. Open Google Chrome and log into GitHub.
2. Click your profile picture in the top right -> **Settings**.
3. On the left sidebar, click **SSH and GPG keys**.
4. Click the green **New SSH key** button.
5. Give it a title (e.g., "Ubuntu External SSD").
6. Paste the copied text into the "Key" box.
7. Click **Add SSH key**.

### Step 5: Test the Connection
Go back to your terminal and type:
```bash
ssh -T git@github.com
```
It will warn you about authenticity. Type `yes` and press Enter.
It should print: *"Hi username! You've successfully authenticated, but GitHub does not provide shell access."*

You are now securely connected to the cloud!

---

## Tips & Warnings

> [!WARNING]
> Never, ever share your Private Key (`id_ed25519` without the `.pub` extension) with anyone, and never upload it to the internet. If someone gets your private key, they can impersonate you on GitHub.

> [!TIP]
> The `ed25519` algorithm we used in the `ssh-keygen` command is the modern, highly secure standard. Older tutorials might tell you to use `rsa`, which is slower and mathematically less secure. Always use `ed25519`.

---

## Exercises

1. Complete the 5-step process above to link your Ubuntu installation to your GitHub account.
2. Go to GitHub and create a new, empty repository called `test-repo`.
3. Follow the instructions GitHub provides on the screen to "Push an existing repository from the command line" to push the `git-test` folder we created in Chapter 28 up to the cloud.

---

## Quiz

**Question 1:** What is the difference between Git and GitHub?
- A) Git is for Mac; GitHub is for Windows.
- B) Git is the local version control software; GitHub is the remote cloud hosting platform for Git repositories.
- C) They are the exact same thing.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Git operates locally on your machine. GitHub hosts your Git repositories on the internet.
</details>

**Question 2:** Which SSH key file do you paste into the GitHub website?
<details>
<summary>Click here for the answer</summary>
**Answer: The Public Key** (ending in `.pub`). The private key must never leave your computer.
</details>

---

## Summary

GitHub is the industry standard platform for hosting code, collaborating, and showcasing your portfolio to employers. By generating an SSH key pair on your Ubuntu workstation and uploading the public key to GitHub, you establish a secure, passwordless connection that allows you to easily `push` and `pull` code to the cloud.

## Next Chapter

Now that our version control and hosting are set up, we need to install the actual programming languages we will be writing. We will start with the engine that powers modern web development: Node.js.

[Go to Chapter 30: Node.js ➡️](30-nodejs.md)
