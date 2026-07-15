# Chapter 36: MongoDB

PostgreSQL and MySQL are relational databases. They force you to define a strict "Schema" (a blueprint) for your data. If you have a `Users` table, and you decide you want to add an `Age` column, you have to run a complex database migration to update the blueprint.

**MongoDB** takes a completely different approach. It is a **NoSQL** database. It doesn't use tables, rows, or columns. It stores data as flexible, JSON-like documents.

## Learning Objectives
By the end of this chapter, you will:
- Understand the difference between SQL and NoSQL.
- Spin up a MongoDB database using Docker.
- Understand how document-based databases map perfectly to JavaScript development (MERN stack).

---

## Theory: Flexible Documents

In MongoDB, a "Record" (a single user) looks like a JavaScript object:

```json
{
  "_id": "5f8a2b...",
  "name": "Alice",
  "email": "alice@example.com",
  "age": 28,
  "hobbies": ["reading", "hiking"]
}
```

If the next user signs up, and you want to save their `favorite_color`, you don't need to update a blueprint. You just save it:

```json
{
  "_id": "5f8a2c...",
  "name": "Bob",
  "email": "bob@example.com",
  "favorite_color": "blue"
}
```

This extreme flexibility makes MongoDB incredibly popular in the startup world. When requirements change rapidly, your database doesn't hold you back. 

### The MERN Stack
MongoDB is a core pillar of the famous **MERN** stack (MongoDB, Express, React, Node.js). 
Because MongoDB stores data in a JSON-like format (BSON), and Node/React use JavaScript (which natively understands JSON), data flows seamlessly from the database, through the server, and to the frontend without requiring complex translation layers.

---

## Practical Example: MongoDB in a Box

Let's use Docker one last time to spin up MongoDB. 

### Step 1: Run the Database
Open your Terminal and run:

```bash
docker run --name my-mongo -p 27017:27017 -d mongo:latest
```

Notice something different? 
Unlike Postgres and MySQL, the official MongoDB Docker image *does not require a password environment variable by default* for local development. It spins up completely open. (Obviously, you would secure it in a production environment).

- `27017`: The default port for MongoDB.

### Step 2: Verify it is running
```bash
docker ps
```
You should see `my-mongo` running.

### Step 3: Connect to the Database
Because MongoDB doesn't use standard SQL, you cannot use a tool like DBeaver (unless you have the premium version) to connect to it.

The industry standard GUI tool for managing MongoDB is **MongoDB Compass**.
You can download the `.deb` file for MongoDB Compass directly from the official MongoDB website and install it using the `sudo dpkg -i` method we learned in Chapter 26.

To connect via Compass, you simply use the default connection string:
`mongodb://localhost:27017`

If you want to connect via the terminal inside the container (using the new `mongosh` shell):
```bash
docker exec -it my-mongo mongosh
```
Type `exit` to leave.

---

## Tips & Warnings

> [!WARNING]
> Because NoSQL databases lack strict blueprints (schemas), it is very easy for a beginner to create a massive, disorganized mess of data. While the database doesn't enforce rules, your backend application code (using libraries like Mongoose in Node.js) absolutely should enforce data validation.

> [!TIP]
> If you are building a small project and don't want to run Docker at all, MongoDB offers a fantastic free cloud tier called **MongoDB Atlas**. You can host your database on their servers for free and just connect to it over the internet.

---

## Exercises

1. Spin up the MongoDB container using Docker.
2. (Optional) Download MongoDB Compass from the web and connect to your local database.
3. Clean up your system: Stop all three databases we created in the last three chapters to free up your computer's RAM.
   ```bash
   docker stop my-postgres my-mysql my-mongo
   ```

---

## Quiz

**Question 1:** How does MongoDB store data differently than MySQL?
- A) It uses encrypted punch cards.
- B) It stores data in flexible, JSON-like documents rather than strict tables and rows.
- C) It stores data in RAM only.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. MongoDB is a document database, making it incredibly flexible for rapidly changing data structures.
</details>

**Question 2:** What is the default port for MongoDB?
<details>
<summary>Click here for the answer</summary>
**Answer: 27017**.
</details>

---

## Summary

MongoDB is a powerful NoSQL database that pairs perfectly with modern JavaScript frameworks. Using Docker, we can spin up a local instance on port 27017 instantly, completely isolated from our host system.

## Next Chapter

We've covered local databases, but modern apps often rely heavily on Cloud services for hosting and databases. In the next chapter, we will introduce Firebase, Google's all-in-one backend-as-a-service.

[Go to Chapter 37: Firebase ➡️](37-firebase.md)
