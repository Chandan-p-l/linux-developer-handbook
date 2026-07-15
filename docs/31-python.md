# Chapter 31: Python

Python is one of the most popular programming languages in the world. It is the undisputed king of Data Science, Machine Learning, and Artificial Intelligence. It is also excellent for building web backends (with Django or FastAPI) and writing quick automation scripts.

However, Python is so important to Linux that the Ubuntu operating system itself relies on it to function. If you mess up your Python installation, you can break Ubuntu. This chapter teaches you how to manage Python safely.

## Learning Objectives
By the end of this chapter, you will:
- Verify your system's Python 3 installation.
- Understand the dangers of global `pip` installations.
- Learn how to create and activate Python Virtual Environments (`venv`).
- Install `pip` for managing Python packages.

---

## Theory: The System Python vs Your Python

If you open your terminal right now and type `python3 --version`, it will print a version number (like `Python 3.10.12`).

**Ubuntu already comes with Python pre-installed.** 

Why? Because many core Ubuntu system tools are actually written in Python. The operating system *needs* Python to run.

This creates a dangerous situation for beginners:
1. You start a Machine Learning project.
2. You use `pip` to install a massive, complex library globally.
3. That library updates a core dependency that Ubuntu relies on.
4. The next time you reboot, the Ubuntu desktop fails to load because you broke its dependencies.

### The Solution: Virtual Environments (`venv`)

To protect the operating system from your messy coding projects, Python developers use **Virtual Environments**. 

A virtual environment is simply an isolated folder. When you "activate" a virtual environment, any Python libraries you download are installed *only* inside that specific folder. The operating system's Python installation remains completely untouched and safe.

**Best Practice:** Never, ever install a Python package globally. Always create a `venv` for every new project.

---

## Practical Example: Setting up Python

*(Note: We have provided an automated script for this in `scripts/install-python.sh`).*

### Step 1: Install `pip` and `venv`
While Python 3 is installed by default, the package manager (`pip`) and the virtual environment module (`venv`) are usually not. Let's install them:

```bash
sudo apt update
sudo apt install python3-pip python3-venv
```

### Step 2: Create a Project Folder
Let's pretend we are starting a new web scraper project.
```bash
mkdir my-scraper
cd my-scraper
```

### Step 3: Create the Virtual Environment
Inside your project folder, tell Python to create a new virtual environment. 
The standard convention is to name the environment folder `env` or `venv`.
```bash
python3 -m venv venv
```
*(This command means: Use `python3`, load the `-m venv` module, and create a folder named `venv`)*.

If you type `ls`, you will see a new folder called `venv` has been created.

### Step 4: Activate the Environment
You must activate the environment before you start working.
```bash
source venv/bin/activate
```
Look closely at your terminal prompt. It will change. It will now have `(venv)` at the beginning of the line. This is your visual cue that you are safely inside the bubble.

```text
(venv) user@ubuntu:~/my-scraper$
```

### Step 5: Install Packages Safely
Now that you are in the bubble, you can install any library you want using `pip`.
```bash
pip install requests beautifulsoup4
```
These packages are now installed *only* inside the `my-scraper` folder. Your system is safe.

### Step 6: Deactivate
When you are done working on the project, you can exit the bubble by typing:
```bash
deactivate
```

---

## Tips & Warnings

> [!WARNING]
> Never use `sudo pip install <package>`. Running pip with sudo installs the package globally at the system level, which can easily break Ubuntu.

> [!TIP]
> If you are pushing your code to GitHub (Chapter 29), you should NEVER upload the `venv` folder. It is huge and contains thousands of files. You should create a `.gitignore` file and add `venv/` to it.

---

## Exercises

1. Install `python3-pip` and `python3-venv`.
2. Create a folder, navigate into it, and create a virtual environment.
3. Activate the environment (look for the `(venv)` prefix in the terminal).
4. Deactivate the environment.

---

## Quiz

**Question 1:** Why is Python already installed on a brand new Ubuntu system?
- A) Because Canonical loves Python.
- B) Because many core Ubuntu system utilities are written in Python and require it to run.
- C) It isn't; you have to install it manually.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Ubuntu relies on Python. This is why you must be careful not to break the system installation.
</details>

**Question 2:** What is the purpose of a Python Virtual Environment (`venv`)?
<details>
<summary>Click here for the answer</summary>
**Answer:** It creates an isolated bubble for your project's dependencies, ensuring that the packages you install do not interfere with other projects or the core operating system.
</details>

---

## Summary

Python is powerful but must be managed carefully on Linux because the OS relies on it. By installing `python3-venv` and strictly adhering to the practice of creating an isolated virtual environment for every project, you ensure your developer workstation remains stable and unbreakable.

## Next Chapter

JavaScript and Python are great, but many enterprise backend systems (especially in banking and large corporations) run on Java. Next, we will cover how to install the Java Development Kit (JDK).

[Go to Chapter 32: Java ➡️](32-java.md)
