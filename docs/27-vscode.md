# Chapter 27: Visual Studio Code

Every developer needs a Code Editor. While Linux has legendary terminal-based editors like `Vim` and `Nano`, the modern industry standard for web development, Python, and general programming is **Visual Studio Code (VS Code)**, built by Microsoft.

VS Code is fast, open-source (mostly), highly customizable, and has an incredibly powerful extension ecosystem.

## Learning Objectives
By the end of this chapter, you will:
- Understand how to add a third-party repository to `apt`.
- Install VS Code securely via the Terminal.
- Learn how to launch VS Code directly from the command line.

---

## Theory: Third-Party Repositories (PPAs)

In the last chapter, we downloaded a `.deb` file for Chrome. That works, but it's a manual process. 

A better way to install third-party software is to add the manufacturer's server (Repository) directly to your `apt` package manager's list. Once you add Microsoft's server to your computer, you can install and update VS Code exactly like normal Ubuntu software using `sudo apt install code`.

To do this securely, we must also download Microsoft's **GPG Key**. This is a cryptographic signature that proves the software actually came from Microsoft and wasn't tampered with by a hacker.

---

## Practical Example: Installing VS Code

*(Note: We have provided an automated script for this in `scripts/install-vscode.sh`).*

### The Manual Terminal Way

Open your Terminal (`Ctrl + Alt + T`) and execute these commands one by one.

**Step 1: Install dependencies**
We need to ensure a tool called `wget` is installed, and that `apt` is allowed to download files over secure HTTPS connections.
```bash
sudo apt update
sudo apt install software-properties-common apt-transport-https wget
```

**Step 2: Import Microsoft's GPG Key**
This command downloads the cryptographic signature and adds it to your trusted keys.
```bash
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
```
*(You should see an "OK" printed on the screen).*

**Step 3: Add the VS Code Repository**
This command adds Microsoft's server to your `apt` sources list.
```bash
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
```

**Step 4: Install VS Code**
Now that your computer knows about Microsoft's server, update the catalog and install the app!
```bash
sudo apt update
sudo apt install code
```

---

## Launching from the Terminal

Now that VS Code is installed, you can find it in the App Grid by searching for "Visual Studio Code". 

However, there is a much faster, developer-centric way to open it. 
In the terminal, you can type `code` followed by a folder name. VS Code will open instantly with that folder loaded in the sidebar.

For example, to open your current directory (represented by a single dot `.`), type:
```bash
code .
```
This is a massive time-saver when navigating your coding projects via the command line.

---

## Screenshots

![VS Code Placeholder](assets/images/vscode-placeholder.png)

*Figure 27.1: Visual Studio Code running natively on Ubuntu, showing the built-in terminal at the bottom.*

---

## Tips & Warnings

> [!TIP]
> Do not confuse "Visual Studio Code" (the lightweight, cross-platform text editor) with "Visual Studio" (the massive, Windows-only IDE used for C# and .NET). We are installing Visual Studio Code.

> [!NOTE]
> There is an alternative called "VSCodium". It is the exact same source code as VS Code, but with Microsoft's telemetry (data tracking) completely removed. If you are highly privacy-conscious, look into VSCodium.

---

## Exercises

1. Use the terminal commands to install VS Code.
2. In the terminal, create a new folder by typing `mkdir my-first-project`.
3. Navigate into that folder by typing `cd my-first-project`.
4. Open VS Code in that folder by typing `code .`
5. In VS Code, create a new file called `index.html` and type `<h1>Hello Linux!</h1>`.

---

## Quiz

**Question 1:** Why do we import a GPG key before adding a third-party repository?
- A) It speeds up the download.
- B) It acts as a cryptographic signature to prove the software is genuinely from the manufacturer and hasn't been tampered with.
- C) It pays for the software license.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Security is paramount in Linux. The GPG key prevents hackers from hijacking the repository and sending you malicious updates.
</details>

**Question 2:** What terminal command opens VS Code in your current directory?
<details>
<summary>Click here for the answer</summary>
**Answer: `code .`** (The dot represents the current directory).
</details>

---

## Summary

By adding Microsoft's repository to your package manager, you ensure that Visual Studio Code can be installed and updated seamlessly. Learning to launch VS Code directly from the terminal using `code .` is a critical workflow improvement for any developer.

## Next Chapter

You can write code, but how do you track changes and collaborate with others? The cornerstone of modern software engineering is Version Control. Next, we will install Git.

[Go to Chapter 28: Git ➡️](28-git.md)
