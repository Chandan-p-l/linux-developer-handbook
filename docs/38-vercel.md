# Chapter 38: Vercel

If you build a modern frontend application (like a React, Vue, or Next.js app), you need a place to host it so the world can see it. 

Historically, you had to rent a Linux server, configure Apache or Nginx, upload your files via FTP, and manually manage SSL certificates. 

Today, the industry standard for frontend deployment is a platform called **Vercel** (the creators of Next.js). It is incredibly powerful, magically simple, and completely free for hobbyists.

## Learning Objectives
By the end of this chapter, you will:
- Understand what a Git-centric deployment workflow is.
- Understand Edge Networks (CDNs).
- Install the Vercel CLI.

---

## Theory: The Git-Centric Workflow

Vercel represents the peak of modern developer workflows. Instead of manually uploading files to a server, Vercel connects directly to your **GitHub** account (which we set up in Chapter 29).

The workflow looks like this:
1. You write code on your Ubuntu SSD.
2. You commit the code and `git push` it to GitHub.
3. **Vercel is watching your GitHub repository.**
4. The moment the code hits GitHub, Vercel automatically pulls it, builds the production version, and deploys it to a global network of servers within seconds.
5. Vercel automatically generates a free SSL certificate (`https`) and gives you a live URL.

If you push a bug to GitHub, you can click a button in the Vercel dashboard to instantly roll back to the previous version. It is magic.

### The Edge Network (CDN)

When you host a website on a traditional server (like a server in New York), someone visiting your site from Tokyo will experience lag because the data has to travel halfway across the world.

Vercel acts as an Edge Network (CDN). When it deploys your site, it copies the HTML/CSS/JS files to servers in New York, Tokyo, London, and Sydney simultaneously. When a user visits your site, they are automatically routed to the server physically closest to them, resulting in lightning-fast load times globally.

---

## Practical Example: Installing the Vercel CLI

While Vercel's primary magic happens automatically via GitHub, there are times you want to deploy a project directly from your Ubuntu terminal without using Git. For this, we use the Vercel CLI.

### Step 1: Install via NPM
Just like Firebase, the Vercel CLI is an NPM package. Open your terminal and run:
```bash
npm i -g vercel
```
*(Note: `i` is a shortcut for `install`).*

### Step 2: Authenticate
Run the login command:
```bash
vercel login
```
The terminal will ask how you want to log in. Use your arrow keys to select **Continue with GitHub**. It will open your browser to authenticate.

### Step 3: Deploying a Project
Imagine you have a folder with a simple `index.html` file inside.
Navigate to that folder in the terminal:
```bash
cd ~/Documents/my-simple-site
```
Deploy it to the world by typing one word:
```bash
vercel
```
The CLI will ask you a few quick questions (Project name, default settings). Press Enter through them.
Within 10 seconds, it will print a "Production URL" to the terminal. Your site is live on the internet.

---

## Tips & Warnings

> [!TIP]
> Vercel is highly optimized for modern frameworks like Next.js, SvelteKit, and Nuxt. If you are building an app with these frameworks, Vercel supports their advanced features (like Server-Side Rendering and Edge Functions) out of the box with zero configuration required on your part.

> [!WARNING]
> Vercel is designed for *Frontend* hosting (and lightweight serverless functions). If you have a heavy, long-running backend server (like a massive Python Django app or a persistent WebSocket server), Vercel is the wrong tool. You need a traditional server (VPS) for that, which we will cover in later chapters.

---

## Exercises

1. Install the Vercel CLI using NPM.
2. Authenticate using your GitHub account.
3. Create a test folder: `mkdir vercel-test && cd vercel-test`.
4. Create an HTML file: `echo "<h1>Hello World from Vercel CLI</h1>" > index.html`.
5. Deploy it: Type `vercel` and follow the prompts. Visit the URL it gives you!

---

## Quiz

**Question 1:** What is a Git-centric deployment workflow?
- A) Uploading files using an FTP client like FileZilla.
- B) Connecting a hosting platform (like Vercel) to your GitHub repository so that every time you `git push`, the site is automatically built and deployed.
- C) Storing your code on a USB drive and mailing it to Vercel.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. This workflow automates deployment, eliminating human error and manual uploads.
</details>

**Question 2:** Why is an Edge Network (CDN) beneficial for your website?
<details>
<summary>Click here for the answer</summary>
**Answer:** It copies your website to servers all over the globe, ensuring that users experience fast load times regardless of where they physically live.
</details>

---

## Summary

Vercel provides the ultimate deployment experience for modern frontend developers. By hooking directly into GitHub, it automates the build and distribution of your website to a global Edge Network. For quick, manual deployments, the Vercel CLI allows you to put any local folder onto the internet with a single terminal command.

## Next Chapter

Vercel is incredible, but it has a massive rival that provides an almost identical service. In the next chapter, we look at Netlify, and discuss why a developer might choose one over the other.

[Go to Chapter 39: Netlify ➡️](39-netlify.md)
