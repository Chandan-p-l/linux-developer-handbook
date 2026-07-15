# Chapter 3: Linux History

To truly understand how Linux works today, it helps to understand where it came from. The history of Linux is a story of corporate rebellion, academic collaboration, and the power of giving things away for free.

## Learning Objectives
By the end of this chapter, you will:
- Understand the origins of Unix.
- Learn about Richard Stallman and the GNU Project.
- Learn about Linus Torvalds and the creation of the Linux kernel.
- Understand how GNU and Linux combined to form the modern operating system.

---

## Theory: The Unix Ancestry

Before Linux, there was **Unix**. 

In the late 1960s and early 1970s, researchers at AT&T's Bell Labs (including Ken Thompson and Dennis Ritchie, who also invented the C programming language) created Unix. 

Unix was revolutionary because it introduced several core concepts that still define modern computing:
- **Everything is a file:** In Unix, everything (even hardware like your keyboard or a hard drive) is treated as a file by the system.
- **Small, modular programs:** Instead of one massive program that does everything, Unix favored tiny programs that did one thing perfectly. You could then chain these programs together to perform complex tasks.

Unix was incredibly powerful, but it was expensive and proprietary. Universities and corporations had to pay massive licensing fees to use it. 

### The GNU Project (1983)

In 1983, a programmer at MIT named **Richard Stallman** became frustrated with the secretive, proprietary nature of software. He believed software should be free—not necessarily free in price, but free in *liberty* (free to read, modify, and share).

He launched the **GNU Project** (a recursive acronym for "GNU's Not Unix"). The goal was to build a completely free and open-source operating system that behaved exactly like Unix, but contained no proprietary Unix code. 

Throughout the 1980s, the GNU project built almost everything an operating system needed: compilers (GCC), text editors (Emacs), and basic command-line tools. 

However, by 1990, they were missing one crucial piece: **The Kernel**.

### What is a Kernel?

The Kernel is the absolute core of an operating system. It is the bridge between the software you write and the physical hardware of your computer (the CPU, RAM, and hard drives). Without a kernel, your software cannot talk to the hardware.

### Enter Linus Torvalds (1991)

In 1991, a 21-year-old computer science student in Finland named **Linus Torvalds** wanted to run a Unix-like system on his personal computer, but he couldn't afford a commercial Unix license. 

For fun, as a hobby project, he started writing his own kernel. 

On August 25, 1991, he posted a famous message to a Usenet newsgroup:

> *"I'm doing a (free) operating system (just a hobby, won't be big and professional like gnu) for 386(486) AT clones. This has been brewing since april, and is starting to get ready..."*

He called his kernel **Linux** (Linus's Unix). 

### The Marriage of GNU and Linux

Linus had a kernel, but no tools to run on it. Richard Stallman had all the tools, but no kernel. 

The community quickly combined the GNU tools with the Linux kernel, creating a complete, fully functional, free operating system. Technically, what we call "Linux" today should actually be called **GNU/Linux**. 

---

## Practical Example: Seeing the Kernel

Even today, you can interact with the kernel directly. When we install Ubuntu later, you will be able to run a simple command to ask the Linux kernel what version it is.

```bash
uname -r
```

**Output:**
```text
6.5.0-27-generic
```

This tiny command is talking directly to the descendant of the exact code Linus Torvalds wrote in his dorm room in 1991.

---

## Tips & Warnings

> [!TIP]
> The mascot of Linux is a penguin named **Tux**. Linus Torvalds chose a penguin because he was once bitten by one at a zoo in Australia and found them amusing. You will see Tux everywhere in the Linux world.

> [!NOTE]
> Linux is often referred to as "Unix-like." macOS (Apple's operating system) is also based on Unix. This is why the terminal on a Mac feels very similar to the terminal on Linux! Windows, however, is built on a completely different architecture (Windows NT).

---

## Exercises

1. Search online for the original email Linus Torvalds sent in 1991 announcing Linux. Note how humble he was about a project that would eventually run the entire internet.
2. If you have access to a Mac, open the "Terminal" app. Type `ls` and press Enter. You are using a Unix command!

---

## Quiz

**Question 1:** What was the piece of software that Linus Torvalds created to complete the GNU project's operating system?
- A) The Graphical User Interface (GUI)
- B) The Kernel
- C) The Web Browser

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Linus Torvalds wrote the Linux Kernel, which acts as the bridge between software and hardware.
</details>

**Question 2:** Which of the following is a core philosophy of Unix?
- A) Everything is a file.
- B) Software should be as expensive as possible.
- C) One massive program should do everything.

<details>
<summary>Click here for the answer</summary>
**Answer: A**. In Unix and Linux, everything is treated as a file, and software is built using small, modular programs.
</details>

---

## Summary

Linux was born out of a desire for free, open-source software. By combining Richard Stallman's GNU tools with Linus Torvalds' kernel, the world was given a powerful, free operating system that would eventually dominate the server and developer landscape. 

## Next Chapter

Now that we know what Linux is, we need to choose a "flavor." There are thousands of different versions of Linux. In the next chapter, we will explain what a "Distribution" is and why we are specifically choosing Ubuntu for this guide.

[Go to Chapter 4: Ubuntu ➡️](04-ubuntu.md)
