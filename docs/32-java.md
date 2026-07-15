# Chapter 32: Java

Java is one of the oldest and most widely used programming languages in enterprise software. From massive banking backends to Android mobile applications, Java runs everywhere. 

Installing Java on Linux can be slightly confusing because there are two different pieces of software (JRE and JDK) and two different versions (Oracle and OpenJDK). This chapter clears up the confusion.

## Learning Objectives
By the end of this chapter, you will:
- Understand the difference between the JRE and the JDK.
- Understand the difference between Oracle Java and OpenJDK.
- Install the OpenJDK on Ubuntu.
- Learn how to manage multiple Java versions.

---

## Theory: The Java Ecosystem

### JRE vs JDK

When you encounter Java, you usually see two acronyms:
1. **JRE (Java Runtime Environment):** This is for *Consumers*. If you just want to play Minecraft or run a program that somebody else wrote in Java, you only need the JRE. It contains the Java Virtual Machine (JVM) that executes the code.
2. **JDK (Java Development Kit):** This is for *Developers*. If you want to write your own Java code, compile it, and debug it, you need the JDK. (The JDK includes the JRE inside it).

*Because you are building a Developer Workstation, you must install the **JDK**.*

### Oracle vs OpenJDK

Java was created by Sun Microsystems, which was later bought by Oracle.
1. **Oracle JDK:** This is the commercial version. It is proprietary and requires a paid license for commercial use. You usually have to download it manually from Oracle's website.
2. **OpenJDK:** This is the free, open-source implementation of Java. It is functionally identical to the Oracle JDK, completely free for commercial use, and built directly into the Ubuntu package manager.

*We will use **OpenJDK**.*

---

## Practical Example: Installing Java

Installing OpenJDK on Ubuntu is incredibly easy via the terminal.

### Step 1: Check if Java is installed
Open your terminal and type:
```bash
java -version
```
If you get an error saying "Command 'java' not found", then Java is not installed. 

### Step 2: Install the Default JDK
Ubuntu maintains a package called `default-jdk`. This package automatically installs the most stable, current LTS version of Java recommended for your version of Ubuntu.

Run this command:
```bash
sudo apt update
sudo apt install default-jdk
```

### Step 3: Verify the Installation
Once the installation finishes, check the version again:
```bash
java -version
```
*Output should look like: `openjdk version "11.0.x"` or `"17.0.x"` or `"21.0.x"`*

You also need to check the compiler version (this proves you installed the Developer Kit, not just the Runtime):
```bash
javac -version
```

### Managing Multiple Versions (`update-alternatives`)

Sometimes, you might have an old project that requires Java 8, and a new project that requires Java 17. 
You can install both!
```bash
sudo apt install openjdk-8-jdk openjdk-17-jdk
```

To switch between them globally, Ubuntu provides a fantastic tool called `update-alternatives`. 
Run this command:
```bash
sudo update-alternatives --config java
```
The terminal will display a numbered list of all installed Java versions. Just type the number of the version you want to use and press Enter!

---

## Tips & Warnings

> [!TIP]
> If you are learning Java to build Android apps, you will eventually need to install Android Studio. Android Studio actually comes bundled with its own isolated version of the JDK, so you don't necessarily have to install it globally on Ubuntu to write Android apps.

> [!WARNING]
> Do not attempt to download `.rpm` packages of Java from random websites. Ubuntu uses `.deb` packages (via `apt`). Trying to force an `.rpm` package (used by Red Hat/Fedora) onto Ubuntu will break things.

---

## Exercises

1. Install the `default-jdk` using `apt`.
2. Verify both the runtime (`java -version`) and the compiler (`javac -version`) are working.
3. Write a quick test. Create a file called `HelloWorld.java`:
   ```java
   public class HelloWorld {
       public static void main(String[] args) {
           System.out.println("Hello Java on Linux!");
       }
   }
   ```
4. Compile it: `javac HelloWorld.java`
5. Run it: `java HelloWorld`

---

## Quiz

**Question 1:** If you want to write and compile your own Java code, which package must you install?
- A) The JRE
- B) The JDK
- C) The JVM

<details>
<summary>Click here for the answer</summary>
**Answer: B**. The Java Development Kit (JDK) contains the compiler (`javac`) necessary to turn your written code into executable byte code.
</details>

**Question 2:** What is the easiest way to switch between multiple installed versions of Java on Ubuntu?
<details>
<summary>Click here for the answer</summary>
**Answer:** Using the `sudo update-alternatives --config java` command.
</details>

---

## Summary

Java remains a powerhouse in the enterprise development world. By installing the open-source OpenJDK via Ubuntu's default package manager, you gain access to a completely free, commercial-ready development environment. If you ever need multiple versions, Ubuntu's `update-alternatives` tool makes switching effortless.

## Next Chapter

We have installed our core languages (Node, Python, Java). But installing software on your computer can get messy. What if you could put an entire database, web server, and app into a tiny, isolated, reproducible box? Next, we tackle the most important modern technology: Docker.

[Go to Chapter 33: Docker ➡️](33-docker.md)
