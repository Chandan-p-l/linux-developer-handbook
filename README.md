<div align="center">
  <a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.herokuapp.com?font=Inter&weight=700&size=40&pause=1000&color=E95420&center=true&vCenter=true&width=800&height=100&lines=Ubuntu+External+SSD+Guide;Portable+Developer+Workstation;Zero+Risk+to+Windows" alt="Typing SVG" /></a>

  **The Complete Beginner's Guide to Linux Development and Portable Workstations**

  <br />

  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](https://opensource.org/licenses/MIT)
  [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=for-the-badge)](http://makeapullrequest.com)

</div>

<br />

## 📖 Introduction

Welcome to the **Ubuntu External SSD Guide** – an open-source handbook designed for absolute beginners. 

This guide teaches you how to install Ubuntu on an external SSD while keeping your Windows installation completely untouched. By following this 50+ chapter handbook, you will transform from a Windows user into a confident Linux developer with a fully functional, portable development environment in your pocket.

---

## ✨ Features

- 🛡️ **Zero Risk to Windows:** Run a full Linux environment without touching your internal hard drive.
- 📚 **50+ In-Depth Chapters:** Master theory, practice with examples, and test yourself with quizzes.
- 🎒 **Portability:** Carry your entire development environment in your pocket and boot it on almost any PC.
- 🛠️ **Developer Workflows:** Complete setup guides for VS Code, Git, Docker, Node.js, Python, PostgreSQL, and more.
- ⚡ **Master the Terminal:** Learn bash scripting, file permissions, cron jobs, and system monitoring.

---

## 🏗️ Architecture Layout

```mermaid
graph TD
    A[External SSD] -->|EFI System| B(FAT32 - 500MB)
    A -->|Root /| C(ext4 - 100GB+)
    A -->|Swap| D(linux-swap - 16GB)
    A -->|Shared Data| E(exFAT - Remaining Space)
```

*(See [Chapter 21: Partitioning](docs/21-partitioning.md) for full details)*

---

## 🚀 Getting Started

This guide is designed to be read sequentially. 

1. **[Theory (Chapters 1-12):](docs/01-introduction.md)** Understand why Linux is useful and how modern booting works.
2. **[Preparation (Chapters 13-19):](docs/13-download-ubuntu.md)** Download Ubuntu and create a bootable USB drive.
3. **[Installation (Chapters 20-23):](docs/20-installation.md)** Install Ubuntu on your external SSD.
4. **[Developer Setup (Chapters 24-42):](docs/24-system-update.md)** Install and configure modern developer tools.
5. **[Mastering Linux (Chapters 43-56):](docs/43-linux-terminal.md)** Master the terminal, permissions, and security.

---

## 🤝 Connect With Me

Built by **Chandan Pal**. I'm always open to connecting, discussing tech, or helping out beginners!

<div align="center">
  
  [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/chandan-pal-49b664205/)
  [![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/chandan_pal101/)
  [![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:chandanpal2301@gmail.com)

</div>

---

## 📄 License & Contribution

We welcome contributions! This project is maintained for beginners, by developers who care about education. Please see [CONTRIBUTING.md](CONTRIBUTING.md) to get started.

This project is licensed under the [MIT License](LICENSE).
