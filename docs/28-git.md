# Chapter 28: Git

If you are going to be a developer, you must know **Git**. It is not optional.

Git is a Version Control System. It tracks every single change you make to your code over time. It allows you to revert mistakes, branch off to try new features without breaking the main code, and collaborate with thousands of other developers simultaneously. 

Git was created by Linus Torvalds (the same person who created Linux) in 2005 to help manage the Linux Kernel source code.

## Learning Objectives
By the end of this chapter, you will:
- Install Git on Ubuntu.
- Configure your Git username and email globally.
- Understand the basic concepts of version control (commits and branches).

---

## Theory: The Time Machine for Code

Imagine writing an essay. You save it as `Essay_v1.docx`. Then you make changes and save it as `Essay_v2_final.docx`. Then you make more changes and save it as `Essay_v3_REAL_FINAL.docx`. 

This is a terrible way to manage files. 

Git solves this. With Git, you just have one folder. Every time you reach a good stopping point in your code, you take a "snapshot" of the folder. This snapshot is called a **Commit**. 
- If you delete 50 lines of code by accident and save the file, you don't panic. You just tell Git to revert the file back to the last Commit.
- If you want to try adding a crazy new feature, you create a **Branch**. This creates an alternate timeline. If the feature fails, you delete the branch and return to the main timeline. If it works, you **Merge** it into the main timeline.

---

## Practical Example: Installing and Configuring Git

Git is usually pre-installed on Ubuntu, but we should ensure we have the latest version. Because Git is open-source and part of the core Linux ecosystem, it is available directly in the default `apt` repositories.

### Step 1: Install Git
Open your Terminal and type:
```bash
sudo apt update
sudo apt install git
```

Verify it is installed by checking the version:
```bash
git --version
```
*(Output should be something like: `git version 2.34.1`)*

### Step 2: Configure Your Identity
Every time you make a "Commit" (a snapshot), Git stamps it with your name and email. This is crucial for collaboration so teams know who wrote which line of code.

You must configure this globally on your new machine. Run these two commands, replacing the quotes with your actual name and email:

```bash
git config --global user.name "John Doe"
git config --global user.email "johndoe@example.com"
```

Verify your configuration by typing:
```bash
git config --list
```
You should see your name and email at the bottom of the list.

### Step 3: Set Default Branch Name
Historically, Git named the primary branch `master`. Due to modern naming conventions, the industry standard has changed to `main`. Tell Git to use `main` for all new projects:
```bash
git config --global init.defaultBranch main
```

---

## Tips & Warnings

> [!TIP]
> The email address you use in `git config` should perfectly match the email address you use to sign up for GitHub (which we will cover in the next chapter). This allows GitHub to properly attribute your code to your profile.

> [!NOTE]
> Git is entirely a command-line tool. While there are GUI applications (like GitKraken) and built-in Git tools in VS Code, you should strive to learn the terminal commands (`git add`, `git commit`, `git push`, `git pull`). It will make you a much stronger developer.

---

## Exercises

1. Install Git and run the three configuration commands (Name, Email, Default Branch).
2. Create a new folder for a test project: `mkdir git-test && cd git-test`
3. Initialize a new Git repository inside that folder: `git init`
4. Notice the terminal output says: `Initialized empty Git repository in /home/user/git-test/.git/`

---

## Quiz

**Question 1:** Who created Git?
- A) Microsoft
- B) Linus Torvalds
- C) Richard Stallman

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Linus Torvalds created Git to help manage the massive collaborative effort of building the Linux kernel.
</details>

**Question 2:** What does the command `git config --global user.name "Your Name"` do?
<details>
<summary>Click here for the answer</summary>
**Answer:** It tells Git to attach "Your Name" to every code commit you make on this computer, ensuring proper attribution in collaborative projects.
</details>

---

## Summary

Git is a decentralized version control system that acts as a time machine for your code. Installing it via `apt` is trivial, but configuring your global username, email, and default branch name is a mandatory setup step for any new developer workstation. 

## Next Chapter

Git manages code on your local computer. But how do you share that code with the world, or back it up to the cloud? You use a hosting platform. Next, we will discuss GitHub.

[Go to Chapter 29: GitHub ➡️](29-github.md)
