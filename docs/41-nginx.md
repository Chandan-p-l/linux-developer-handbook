# Chapter 41: Nginx

In the last chapter, we learned that renting a VPS gives you a raw, empty Linux server. If you put your HTML files on that server, nobody on the internet can see them. 

To serve files to the world, you need a specialized piece of software called a **Web Server**. The two most famous web servers are Apache and Nginx. Today, **Nginx** (pronounced "Engine-X") is the modern industry standard.

## Learning Objectives
By the end of this chapter, you will:
- Understand the role of a Web Server.
- Install Nginx using the Ubuntu package manager.
- Understand the concept of a Reverse Proxy.
- Learn where default HTML files are stored in Linux.

---

## Theory: The Traffic Cop

A web server's job is deceptively simple: it listens for HTTP requests on Port 80 (and HTTPS on Port 443). 

When a user in Japan types `yourwebsite.com` into their browser, the request travels across the ocean, hits your Ubuntu server, and knocks on Port 80.
**Nginx** answers the door.

Nginx looks at the request, finds the correct `index.html` file on your hard drive, and sends it back to the user in Japan.

### The Reverse Proxy
Nginx is not just for static HTML files. Its true superpower is acting as a **Reverse Proxy**.

Imagine you have a complex Node.js backend server running on your VPS on Port 3000. 
You don't want the internet talking directly to Port 3000. It's unsafe, and Node.js isn't great at handling massive floods of raw traffic or encrypting SSL certificates.

Instead, you put Nginx on the front line (Port 80). 
When traffic comes in, Nginx intercepts it, inspects it for security, decrypts the SSL, and then *secretly passes the traffic* (proxies it) back to your Node.js app on Port 3000. Your Node app never touches the public internet directly. Nginx acts as a powerful, hyper-fast shield.

---

## Practical Example: Installing Nginx

You can install Nginx right now on your local Ubuntu workstation to see how it works.

### Step 1: Install
Open your Terminal and run:
```bash
sudo apt update
sudo apt install nginx
```

### Step 2: Verify it is running
Nginx automatically starts running in the background as a system service.
To check its status, run:
```bash
systemctl status nginx
```
*(You should see a green dot and the word `active (running)`. Press `q` to exit the status view).*

### Step 3: View your Website
Your local Ubuntu machine is now officially a web server!
Open Google Chrome on your Ubuntu desktop.
In the URL bar, type:
```text
localhost
```
Press Enter. You should see a bold "Welcome to nginx!" screen.

### Step 4: Where is the HTML?
Where did that welcome screen come from? In Ubuntu, the default location for public HTML files is `/var/www/html`.

Let's prove it by changing the file.
In your terminal, run this command to overwrite the default file with your own message:
```bash
echo "<h1>My Portable Developer Workstation is alive!</h1>" | sudo tee /var/www/html/index.html
```
Now, go back to Google Chrome and refresh the `localhost` page. The "Welcome to nginx" screen is gone, replaced by your custom message!

---

## Tips & Warnings

> [!TIP]
> If you ever rent a VPS and install Nginx, the process is exactly the same as above. The only difference is that instead of typing `localhost` in your browser, you would type the public IP address of your VPS server, and the entire world could see your HTML file.

> [!WARNING]
> Do not attempt to run a Node.js server, a Python Django server, and Apache on Port 80 simultaneously. Port 80 can only be used by one application at a time. This is why we use Nginx as a Reverse Proxy—Nginx owns Port 80 and delegates traffic to the others.

---

## Exercises

1. Install Nginx using `apt`.
2. Check the system status using `systemctl`.
3. View the default page by navigating to `localhost` in your browser.
4. Modify the `index.html` file in `/var/www/html` to personalize your server.

---

## Quiz

**Question 1:** What is the primary job of Nginx?
- A) It is a relational database.
- B) It listens for HTTP traffic on port 80/443 and serves web pages or acts as a reverse proxy.
- C) It translates Python into JavaScript.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Nginx is a high-performance web server and reverse proxy.
</details>

**Question 2:** In Ubuntu, what is the default directory where Nginx looks for HTML files to serve?
<details>
<summary>Click here for the answer</summary>
**Answer:** `/var/www/html`
</details>

---

## Summary

Nginx is the backbone of the modern web. By acting as both a web server for static files and a robust reverse proxy for backend applications, it ensures your code is served quickly and securely. Installing and configuring it on your local machine is identical to configuring it on a production cloud server.

## Next Chapter

Before Nginx conquered the world, there was another web server that built the foundation of the internet. It is still used by millions of websites today. In the next chapter, we will briefly discuss Apache.

[Go to Chapter 42: Apache ➡️](42-apache.md)
