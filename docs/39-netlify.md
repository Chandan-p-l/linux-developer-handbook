# Chapter 39: Netlify

In the previous chapter, we explored Vercel, the industry leader for modern frontend hosting. However, it is not the only player in the game. **Netlify** is a massive competitor that offers an almost identical Git-centric workflow and Edge Network.

Why should a developer care about both? Competition breeds features. Sometimes a project's specific requirements might make Netlify a better choice than Vercel, or vice versa.

## Learning Objectives
By the end of this chapter, you will:
- Understand the similarities between Netlify and Vercel.
- Learn about Netlify's unique features (Forms, Identity).
- Install the Netlify CLI.

---

## Theory: The Jamstack Pioneers

Netlify was one of the original pioneers of the "Jamstack" (JavaScript, APIs, and Markup) architecture. They championed the idea that websites should be pre-built into static HTML files and served instantly over a CDN, rather than generated on-the-fly by a heavy backend server (like WordPress does).

### Vercel vs Netlify: The Difference

At their core, both platforms do the exact same thing:
1. You connect your GitHub repository.
2. You push code.
3. They build the site and deploy it globally for free.

So, how do they differ?

**Vercel's Advantage:** Vercel created the Next.js framework. If you are building a React application using Next.js, Vercel is highly optimized for it. Advanced features like Server-Side Rendering (SSR) and Image Optimization work on Vercel flawlessly with zero configuration.

**Netlify's Advantage:** Netlify provides several built-in "Backend" features out of the box that Vercel traditionally requires third-party plugins for. 
- **Netlify Forms:** If you put a simple `<form>` HTML tag on your website, Netlify will automatically detect it, capture user submissions, and email them to you, without you having to write a single line of backend database code.
- **Netlify Identity:** A built-in user authentication system, similar to a lightweight version of Firebase Auth.

---

## Practical Example: Installing the Netlify CLI

Just like Firebase and Vercel, Netlify offers a powerful CLI distributed via NPM.

### Step 1: Install via NPM
Open your terminal and run:
```bash
npm install netlify-cli -g
```

### Step 2: Authenticate
Run the login command:
```bash
netlify login
```
This will open your web browser. Grant the CLI permission to access your Netlify account (create one using your GitHub account if you haven't already).

### Step 3: Deploying a Project
The command to deploy a project is slightly different than Vercel.
Navigate to your project folder:
```bash
cd ~/Documents/my-simple-site
```
Type:
```bash
netlify deploy
```
The CLI will ask you some setup questions (e.g., "Create & configure a new site"). 
Crucially, this command only deploys a "Draft" version of your site to a hidden URL so you can test it. 

To push the site to your actual, public production URL, you must run:
```bash
netlify deploy --prod
```

---

## Tips & Warnings

> [!TIP]
> Both Netlify and Vercel offer generous free tiers. It is highly recommended that every developer creates an account on both platforms. Try deploying a small project to both and see which dashboard and workflow you prefer.

> [!WARNING]
> While Netlify Forms is incredible for simple "Contact Us" pages, it is not a replacement for a real database if your application requires complex relational data or user-generated content feeds.

---

## Exercises

1. Install the Netlify CLI using NPM.
2. Authenticate using the `netlify login` command.
3. Use the same `vercel-test` folder you created in the previous chapter. Deploy it to Netlify using the `netlify deploy --prod` command. You now have the exact same website hosted on two different global CDNs!

---

## Quiz

**Question 1:** What built-in feature makes Netlify particularly attractive for simple static websites that need a "Contact Us" page?
- A) Free Next.js integration.
- B) Netlify Forms, which automatically captures HTML form submissions without requiring a backend database.
- C) Netlify Docker.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Netlify Forms is a killer feature for freelancers building simple portfolio sites for clients.
</details>

**Question 2:** What command pushes a Netlify deployment to the live public URL instead of a hidden draft URL?
<details>
<summary>Click here for the answer</summary>
**Answer: `netlify deploy --prod`**
</details>

---

## Summary

Netlify is a powerhouse in the modern web development ecosystem. While it shares the core Git-centric deployment philosophy with Vercel, its inclusion of built-in features like Forms and Identity make it a compelling choice for developers looking for an all-in-one platform for static sites.

## Next Chapter

Vercel and Netlify are perfect for modern frontend apps. But what if you are building an old-school WordPress site, or you have a massive custom Python backend that needs a real Linux server? Next, we discuss traditional Virtual Private Servers (VPS) and providers like Hostinger.

[Go to Chapter 40: Hostinger ➡️](40-hostinger.md)
