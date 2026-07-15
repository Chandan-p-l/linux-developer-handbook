# Chapter 30: Node.js

Historically, JavaScript could only run inside a web browser (like Chrome or Firefox) to make websites interactive. In 2009, Ryan Dahl created **Node.js**, a program that takes the JavaScript engine out of the browser and lets it run directly on your computer's operating system. 

This changed the world. Suddenly, developers could use JavaScript to write backend servers, command-line tools, and desktop applications. Node.js is a mandatory installation for modern web development.

## Learning Objectives
By the end of this chapter, you will:
- Understand the flaws of installing Node via the default `apt` repository.
- Learn what NVM (Node Version Manager) is.
- Install the latest LTS version of Node.js using best practices.
- Understand what NPM is.

---

## Theory: The Global vs Version Manager Problem

If you open your terminal and type `sudo apt install nodejs`, Ubuntu *will* install Node.js. 

**DO NOT DO THIS.**

Here is why:
1. The version in the default Ubuntu repository is usually several years old. It lacks modern features.
2. It installs Node "globally" with root (`sudo`) permissions. When you try to install global packages later, you will get "Permission Denied" errors and be forced to use `sudo` for everyday coding tasks, which is a massive security risk.
3. You might have Project A that requires Node v18, and Project B that requires Node v20. The `apt` method only lets you have one version installed at a time.

### The Solution: NVM (Node Version Manager)

The industry best-practice is to use a tool called **NVM**. 
NVM sits inside your Home folder. It allows you to download and install multiple different versions of Node.js simultaneously, and switch between them instantly with a single command. 

Because NVM installs Node entirely inside your Home folder (`/home/user/.nvm`), it does not require `sudo` permissions. You will never get a permission error.

---

## Practical Example: Installing Node via NVM

*(Note: We have provided an automated script for this in `scripts/install-node.sh`).*

### Step 1: Install NVM
Open your Terminal and use `curl` to download and run the NVM installation script:
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
*(Check the NVM GitHub page to ensure v0.39.7 is still the latest script version).*

The script will download NVM and automatically add a few lines of code to a hidden file in your home directory called `.bashrc`. 

### Step 2: Reload the Terminal
The terminal doesn't know NVM exists yet. You must either close the terminal window and open a new one, or type this command to reload the configuration:
```bash
source ~/.bashrc
```

Verify NVM is installed:
```bash
nvm --version
```

### Step 3: Install Node.js LTS
Now use NVM to download the latest Long Term Support (LTS) version of Node.js.
```bash
nvm install --lts
```
NVM will download Node.js and a tool called NPM (Node Package Manager) from the internet and set it as your default version.

Verify both are installed:
```bash
node --version
npm --version
```

---

## What is NPM?

When you installed Node, you also got **NPM (Node Package Manager)**. 
NPM is to JavaScript what `apt` is to Ubuntu. 

It is the world's largest software registry. If you are building a website and need a pre-written library to handle Dates, or a library to create 3D graphics (like Three.js), or a massive framework like React, you download them into your project using NPM.

Example:
```bash
npm install react
```

---

## Tips & Warnings

> [!WARNING]
> If you ever type `npm install -g <package>` and it throws an `EACCES` or "Permission Denied" error, it means you did not install Node via NVM. You likely installed it via `apt` or `snap`. You should uninstall it and use NVM.

> [!TIP]
> If you pull a project from GitHub and it refuses to run, check the `package.json` file. It might require an older version of Node. If it requires v16, simply run `nvm install 16` and then `nvm use 16`. NVM handles the switch instantly.

---

## Exercises

1. Install NVM using the `curl` command.
2. Install the LTS version of Node.js.
3. Create a test file. In the terminal, type `echo "console.log('Hello from Node!');" > test.js`.
4. Run the file using Node: `node test.js`. It should print your message to the terminal!

---

## Quiz

**Question 1:** Why is it a bad idea to install Node.js using `sudo apt install nodejs`?
- A) It costs money.
- B) It installs an outdated version globally with root permissions, leading to frustrating permission errors later.
- C) It deletes Python.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Installing globally via `apt` breaks permissions for global NPM packages. NVM installs Node locally in your home directory, bypassing this issue completely.
</details>

**Question 2:** What tool allows you to easily switch between different versions of Node.js for different projects?
<details>
<summary>Click here for the answer</summary>
**Answer: NVM (Node Version Manager)**.
</details>

---

## Summary

Node.js allows JavaScript to run outside the browser, powering modern backend and full-stack development. By using NVM (Node Version Manager) instead of the default package manager, you ensure you have the latest LTS versions, avoid frustrating permission errors, and can easily switch versions between projects.

## Next Chapter

Web development relies on JavaScript, but data science, machine learning, and automation rely on Python. In the next chapter, we will look at how Python is managed in Linux and set up a safe environment for it.

[Go to Chapter 31: Python ➡️](31-python.md)
