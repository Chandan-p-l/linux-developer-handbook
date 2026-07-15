# Chapter 33: Docker

In the old days of software development, setting up a new project was a nightmare. If you wanted to run a web app locally, you had to install a specific version of Node.js, install a PostgreSQL database, configure a Redis cache, and hope your operating system didn't conflict with any of them. If you sent your code to a friend, they had to do the exact same manual setup.

**Docker** solved this problem forever. It is arguably the most important tool you will learn in this guide.

## Learning Objectives
By the end of this chapter, you will:
- Understand the difference between a Container and a Virtual Machine.
- Learn why Docker is revolutionary for developers.
- Install Docker securely using the official repository.
- Run your first Docker container.

---

## Theory: Shipping Containers for Code

Before the invention of the standard shipping container in the 1950s, loading cargo onto ships was a slow, chaotic mess. Sacks of flour were mixed with barrels of oil and crates of cars. 

The standardized metal shipping container revolutionized trade because it didn't matter what was inside the box. A crane could pick up the box and put it on a ship, a train, or a truck with zero friction.

**Docker does this for software.**

Docker allows you to wrap your code, along with *everything* it needs to run (the language, the database, the configuration files), into a standardized digital box called a **Container**. 

### Containers vs Virtual Machines (VMs)
We discussed VMs in Chapter 6. A VM contains a full, heavy operating system (Windows + a fake hard drive + fake RAM).
A Docker Container is incredibly lightweight. It does *not* contain an operating system. It shares the host's Linux kernel and only contains the specific app files. 
- A VM takes minutes to boot and uses gigabytes of RAM.
- A Container takes 1 second to start and uses megabytes of RAM. You can easily run 20 containers simultaneously on your laptop.

### The "It works on my machine" Cure
If you build an app inside a Docker container on your Ubuntu SSD and it works perfectly, you can send that container to a friend on a Mac, or deploy it to a server on AWS, and it is **100% guaranteed** to run exactly the same way. No dependency conflicts. No setup required.

---

## Practical Example: Installing Docker

*(Note: We have provided an automated script for this in `scripts/install-docker.sh`).*

Installing Docker requires adding their official repository to `apt`.

### Step 1: Set up the repository
Open Terminal and run these commands to add Docker's GPG key and server:

```bash
# Update and install tools
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

### Step 2: Install Docker Engine
```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Step 3: Post-Installation (Crucial)
By default, Docker requires `sudo` privileges to run. Typing `sudo` every time you run a container is annoying and a security risk. We need to add your user account to the `docker` group.

```bash
sudo groupadd docker
sudo usermod -aG docker $USER
```
**CRITICAL:** For this change to take effect, you must completely log out of Ubuntu and log back in (or simply restart the computer).

### Step 4: Run your first container
After rebooting, open the terminal and type:
```bash
docker run hello-world
```
Docker will look for the "hello-world" container on your computer. When it doesn't find it, it will automatically download it from the internet (Docker Hub) and run it. You should see a welcome message!

---

## Tips & Warnings

> [!WARNING]
> Do not use `sudo apt install docker.io`. This is an older, community-maintained version of Docker that is often out of date. Always follow the official installation method above to get the latest `docker-ce` (Community Edition).

> [!TIP]
> Docker Desktop (the graphical user interface) is available for Linux, but it is highly recommended to learn the Docker command-line tools first (`docker run`, `docker ps`, `docker stop`). The CLI is what you will use when deploying apps to remote servers.

---

## Exercises

1. Complete the installation and the post-installation group addition.
2. Run `docker run hello-world`.
3. Try running a temporary, disposable Ubuntu container *inside* your Ubuntu system:
   `docker run -it ubuntu bash`
   (When you type `exit`, the container is destroyed instantly).

---

## Quiz

**Question 1:** Why is a Docker Container more efficient than a Virtual Machine?
- A) It is written in C++.
- B) A container does not run a full, heavy operating system; it shares the host's Linux kernel and only packs the specific application dependencies.
- C) It compresses the files.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Containers are extremely lightweight because they share the underlying OS kernel, allowing them to boot in milliseconds.
</details>

**Question 2:** Why do we run the `usermod -aG docker $USER` command?
<details>
<summary>Click here for the answer</summary>
**Answer:** To add our user to the 'docker' group. This allows us to run Docker commands without needing to type `sudo` every time.
</details>

---

## Summary

Docker fundamentally changed software engineering. By packaging applications into lightweight, portable containers, developers eliminated the "it works on my machine" problem. Installing Docker via the official repository and configuring your user permissions is the final step in creating a truly modern developer workstation.

## Next Chapter

Now that we have Docker, we don't ever need to install databases directly onto our computer. In the next chapter, we will use Docker to spin up a PostgreSQL database in exactly one second.

[Go to Chapter 34: PostgreSQL ➡️](34-postgresql.md)
