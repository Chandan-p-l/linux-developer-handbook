# Chapter 34: PostgreSQL

Almost every web application requires a database to store user accounts, posts, and settings. **PostgreSQL** (often just called Postgres) is widely considered the most advanced, stable, and powerful open-source relational database in the world. It is the default choice for modern web frameworks like Django, Ruby on Rails, and Next.js.

While you *could* install PostgreSQL directly onto Ubuntu using `apt`, we are going to use the superpower we unlocked in the last chapter: **Docker**.

## Learning Objectives
By the end of this chapter, you will:
- Understand why running databases in Docker is superior for local development.
- Spin up a PostgreSQL database using a single Docker command.
- Learn how to connect to the database.
- Understand persistent volumes in Docker.

---

## Theory: The Clean Environment

If you install a database directly onto your operating system using `sudo apt install postgresql`, several things happen:
1. It installs massive background services that run constantly, draining your battery even when you aren't coding.
2. It litters configuration files all over your `/etc` directory.
3. If you mess up the configuration, it is incredibly difficult to uninstall and fix cleanly.
4. If you have Project A that requires Postgres v12, and Project B that requires Postgres v16, you will have a nightmare trying to run both simultaneously.

### The Docker Solution
By running Postgres inside a Docker container, the database lives in an isolated box. 
- You can start it in 1 second.
- You can stop it in 1 second (saving battery).
- If you break it, you simply delete the container and create a new one instantly.
- You can easily run Postgres v12 and v16 simultaneously on different ports.

---

## Practical Example: Postgres in a Box

Make sure you completed Chapter 33 and Docker is installed and running without `sudo`.

### Step 1: Run the Database
Open your Terminal and run this single, massive command:

```bash
docker run --name my-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres:latest
```

Let's break down exactly what you just did:
- `docker run`: Tell Docker to create a new container.
- `--name my-postgres`: Give the container a friendly name so we can find it later.
- `-e POSTGRES_PASSWORD=mysecretpassword`: Set an Environment Variable that creates the master database password.
- `-p 5432:5432`: Maps the default Postgres port (5432) from *inside* the container to port 5432 on your *outside* Ubuntu computer.
- `-d`: Run in "detached" mode (in the background, so you can keep using the terminal).
- `postgres:latest`: The name of the official image to download from Docker Hub.

### Step 2: Verify it is running
Type this command to see all currently running containers:
```bash
docker ps
```
You should see `my-postgres` in the list, showing an "Up" status. 

### Step 3: Connect to the Database
Your database is now running! You can connect to it using any graphical database tool (like DBeaver or pgAdmin) using these credentials:
- **Host:** `localhost`
- **Port:** `5432`
- **User:** `postgres`
- **Password:** `mysecretpassword`

If you want to connect via the terminal (using the `psql` command-line tool *inside* the container), run this:
```bash
docker exec -it my-postgres psql -U postgres
```
You will enter the database shell (your prompt will change to `postgres=#`). Type `\q` and press Enter to exit.

### Step 4: Stop and Start
When you are done coding for the day, you can stop the database to save RAM:
```bash
docker stop my-postgres
```
The next day, when you want to code again, just start it back up:
```bash
docker start my-postgres
```

---

## Tips & Warnings

> [!WARNING]
> By default, if you delete a Docker container, all the data inside it is destroyed. For a local development database, this is usually fine. If you want the data to survive even if the container is destroyed, you must learn about **Docker Volumes** (e.g., adding `-v my_db_data:/var/lib/postgresql/data` to your run command).

> [!TIP]
> It is highly recommended to install a GUI tool like **DBeaver** to manage your databases visually. You can install it on Ubuntu via the Ubuntu Software Center (Snap) or by downloading the `.deb` file from their website.

---

## Exercises

1. Run the `docker run` command provided above.
2. Use `docker ps` to verify it is running.
3. Stop the container using `docker stop my-postgres`. Check `docker ps` again to see that it has disappeared from the active list.
4. Start it again using `docker start my-postgres`.

---

## Quiz

**Question 1:** Why is using Docker for a local development database better than installing it directly via `apt`?
- A) It runs much faster.
- B) It keeps your operating system clean, avoids background battery drain, and prevents version conflicts.
- C) It provides a free cloud backup.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Docker keeps your host OS completely clean and allows you to spin up and tear down databases effortlessly.
</details>

**Question 2:** In the command `-p 5432:5432`, what does this do?
<details>
<summary>Click here for the answer</summary>
**Answer:** It maps port 5432 inside the isolated Docker container to port 5432 on your main Ubuntu computer, allowing your code (running on your host machine) to talk to the database.
</details>

---

## Summary

PostgreSQL is a massive, complex piece of software. By utilizing Docker, we can condense the entire installation, configuration, and execution process into a single, clean terminal command. This isolated approach is the modern standard for local web development.

## Next Chapter

PostgreSQL is a relational SQL database. But what if your project uses a NoSQL database? In the next chapter, we will use the exact same Docker magic to spin up a MySQL and MongoDB database.

[Go to Chapter 35: MySQL ➡️](35-mysql.md)
