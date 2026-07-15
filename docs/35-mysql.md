# Chapter 35: MySQL

While PostgreSQL is the darling of modern web frameworks, **MySQL** is the undisputed king of the legacy web. It powers WordPress, PHP applications, and millions of enterprise systems worldwide. It is a fundamental relational database that every developer should know how to interact with.

Just like with PostgreSQL, we will use Docker to run MySQL cleanly and safely.

## Learning Objectives
By the end of this chapter, you will:
- Understand the similarities and use cases for MySQL vs PostgreSQL.
- Spin up a MySQL database using Docker.
- Understand port conflicts.

---

## Theory: The Relational Standard

MySQL and PostgreSQL are both Relational Database Management Systems (RDBMS). They both use tables, rows, columns, and the SQL (Structured Query Language) to interact with data. 

- **PostgreSQL** is often chosen for complex data structures, strict data integrity, and advanced JSON handling.
- **MySQL** is often chosen for its incredible read-speed, massive ecosystem, and legacy compatibility (especially with PHP and WordPress).

As a developer, you don't need to pick a favorite. You need to know how to spin up whichever one your current project requires.

---

## Practical Example: MySQL in a Box

Make sure Docker is installed and running (Chapter 33).

### Step 1: Run the Database
Open your Terminal and run this command:

```bash
docker run --name my-mysql -e MYSQL_ROOT_PASSWORD=mysecretpassword -p 3306:3306 -d mysql:latest
```

Let's break down the differences from our previous Postgres command:
- `--name my-mysql`: We gave it a unique name.
- `-e MYSQL_ROOT_PASSWORD=mysecretpassword`: The environment variable required by the official MySQL image to set the root password.
- `-p 3306:3306`: MySQL uses port `3306` by default (Postgres uses 5432). We map the container's 3306 to our Ubuntu host's 3306.
- `mysql:latest`: The official Docker image name.

### Step 2: Verify it is running
```bash
docker ps
```
You should now see `my-mysql` in the list alongside `my-postgres` (if you didn't stop it in the last chapter).

### Port Conflicts (The "Address Already in Use" Error)
What happens if you try to run *two* MySQL containers at the same time?
If you try to run `-p 3306:3306` again, Docker will throw an error: `Bind for 0.0.0.0:3306 failed: port is already allocated`.

You only have one Port 3306 on your Ubuntu machine. If the first container is using it, the second container cannot. 
To run a second MySQL database, you simply change the *host* port (the first number):
`-p 3307:3306`
Now, your second database is accessible on port 3307, while inside the container, it still thinks it is running on 3306. This is the magic of Docker networking!

### Step 3: Connect to the Database
You can connect using DBeaver, MySQL Workbench, or DataGrip using these credentials:
- **Host:** `localhost`
- **Port:** `3306`
- **User:** `root`
- **Password:** `mysecretpassword`

If you want to connect via the terminal inside the container:
```bash
docker exec -it my-mysql mysql -u root -p
```
*(It will prompt you for the password: `mysecretpassword`)*
Type `exit` to leave the MySQL shell.

---

## Tips & Warnings

> [!WARNING]
> By default, logging in as the `root` user in MySQL for everyday application development is a bad security practice. In a real production environment, you would create a dedicated user with limited privileges for your app to use.

> [!TIP]
> If you are working on a massive project that requires MySQL, Redis, and a Node backend all running simultaneously, typing `docker run` three times gets tedious. Developers use a tool called **Docker Compose** to start all three containers with a single command. (Docker Compose was installed automatically in Chapter 33!).

---

## Exercises

1. Spin up the MySQL container using the `docker run` command.
2. Use `docker ps` to verify it is running.
3. Stop the container (`docker stop my-mysql`).
4. (Optional) If you have a GUI database tool like DBeaver installed, try connecting to it while it is running.

---

## Quiz

**Question 1:** What is the default port used by MySQL?
- A) 5432
- B) 8080
- C) 3306

<details>
<summary>Click here for the answer</summary>
**Answer: C**. MySQL uses 3306, while PostgreSQL uses 5432.
</details>

**Question 2:** If you want to run two MySQL databases at the same time, how do you solve the port conflict in Docker?
<details>
<summary>Click here for the answer</summary>
**Answer:** Change the host port mapping in the `docker run` command (e.g., `-p 3307:3306`).
</details>

---

## Summary

MySQL is a ubiquitous relational database. By using Docker to manage it, you can easily switch between MySQL and PostgreSQL projects without cluttering your host operating system, and you can solve port conflicts effortlessly.

## Next Chapter

Relational databases are great, but modern web apps often deal with massive amounts of unstructured, flexible data. For that, we use a NoSQL database. Next, we will spin up MongoDB.

[Go to Chapter 36: MongoDB ➡️](36-mongodb.md)
