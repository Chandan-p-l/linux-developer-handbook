# Chapter 14: Verify Download

You have just downloaded a 5GB `.iso` file from the internet. 

Because it is so large, there is a small chance that a network packet was dropped during the download, or your browser glitched, resulting in a tiny, almost imperceptible corruption in the file. 

If you try to install an operating system using a corrupted ISO, the installation will randomly crash, fail, or produce a broken system. To prevent this, we must **Verify** the download.

## Learning Objectives
By the end of this chapter, you will:
- Understand what a Checksum (Hash) is.
- Learn how to use Windows PowerShell to generate a SHA256 hash.
- Verify that your Ubuntu ISO is a perfect, uncorrupted copy.

---

## Theory: The Cryptographic Hash

How do you prove that a 5GB file on your computer is 100% identical to the 5GB file on Ubuntu's servers? You can't compare them word-by-word over the internet.

Instead, we use a mathematical algorithm called a **Cryptographic Hash Function** (specifically, SHA-256).

Think of a Hash Function as a meat grinder. You put a file into the top of the grinder, turn the crank, and out comes a fixed-length string of random letters and numbers (the Hash).
- If you put the exact same file into the grinder, you will *always* get the exact same string of letters and numbers out.
- If you change a single byte in the 5GB file, the resulting string of letters and numbers will change completely.

Ubuntu publishes the "Correct Hash" on their website. You will grind up your downloaded file, look at the resulting hash on your computer, and compare it to the hash on Ubuntu's website. If they match perfectly, your file is flawless.

---

## Practical Example: Verifying via PowerShell

We don't need any special software to do this; Windows has a tool built-in.

### Step 1: Find the Official Hash
1. Go back to the Ubuntu download page where you got the ISO.
2. Below the download button, look for a link that says **"Verify your download"** or **"SHA256 Checksums"**.
3. It will display a long string of characters. For example (this is just an example, yours will be different):
   `8c5fc248943927361... (etc)`
4. Keep this webpage open.

### Step 2: Generate the Hash on your PC
1. Press the Windows key, type `PowerShell`, and open it.
2. Type the following command to navigate to your Downloads folder:
   ```powershell
   cd ~\Downloads
   ```
3. Now, ask Windows to generate the SHA256 hash of the ISO file. Type this command (replace the filename with the exact name of your downloaded file):
   ```powershell
   Get-FileHash ubuntu-24.04-desktop-amd64.iso -Algorithm SHA256
   ```
4. Press Enter. Because the file is huge, your computer might freeze for about 10 to 30 seconds while it grinds the file.

### Step 3: Compare
The PowerShell window will spit out a hash.
Compare the first 5 characters and the last 5 characters of the hash in PowerShell with the hash on the Ubuntu website.
If they match, your download is perfect.

---

## Terminal Output

```powershell
PS C:\Users\John\Downloads> Get-FileHash ubuntu-24.04-desktop-amd64.iso -Algorithm SHA256

Algorithm       Hash                                                                   Path
---------       ----                                                                   ----
SHA256          8C5FC2489439273619712...[etc]                                          C:\Users\John\Downlo...
```

---

## Tips & Warnings

> [!TIP]
> Verifying checksums is a standard security practice in the software development world. It not only proves the file isn't corrupted, but it also proves the file wasn't intercepted and injected with malware by a hacker (since the hacker wouldn't be able to forge the hash).

> [!WARNING]
> If your hashes do NOT match, delete the `.iso` file from your Downloads folder immediately and download it again. Do not attempt to use a corrupted ISO.

---

## Exercises

1. Perform the verification step right now on your downloaded Ubuntu ISO.
2. Open PowerShell, run `Get-FileHash`, and visually confirm that the hash matches the one on the official Ubuntu website. 

---

## Quiz

**Question 1:** What happens to the SHA256 hash if a single byte in a 5GB file is altered?
- A) Only the last letter of the hash changes.
- B) The entire hash string changes completely.
- C) The hash remains the same.

<details>
<summary>Click here for the answer</summary>
**Answer: B**. Hash functions are designed so that any minute change to the input data completely alters the output hash, making it incredibly easy to detect corruption.
</details>

**Question 2:** Why shouldn't you ignore a mismatched checksum?
<details>
<summary>Click here for the answer</summary>
**Answer:** A mismatch means the file is either corrupted (which will break the installation) or compromised by malware. It must be redownloaded.
</details>

---

## Summary

Before installing any operating system, you should use a Cryptographic Hash (SHA256) to verify the integrity of the downloaded ISO file. This ensures the file is not corrupted and is safe to use. You can easily do this using the built-in `Get-FileHash` command in Windows PowerShell.

## Next Chapter

We have the perfect, verified ISO file. But how do we get it onto our small USB flash drive so the computer can boot from it? We need special software. In the next chapter, we will look at a tool called Rufus.

[Go to Chapter 15: Rufus ➡️](15-rufus.md)
