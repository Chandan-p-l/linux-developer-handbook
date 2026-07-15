# Contributing to Ubuntu External SSD Guide

First off, thank you for considering contributing to the Ubuntu External SSD Guide! It's people like you that make this guide a great tool for beginners worldwide.

## Why Contribute?

This project aims to be the most comprehensive, beginner-friendly guide for setting up a portable developer workstation on an external SSD. By contributing, you help make the learning curve smoother for thousands of students, developers, and enthusiasts.

## How Can I Contribute?

### Reporting Bugs and Issues

If you find a typo, a broken link, or an instruction that no longer works because of software updates, please open an issue!

- Use the **Bug Report** template when opening an issue.
- Describe what chapter or file the issue is in.
- Provide as much detail as possible.

### Suggesting Enhancements

Have an idea for a new chapter? Want to add a troubleshooting tip?

- Use the **Feature Request** template.
- Explain why the enhancement would be useful for beginners.

### Submitting Pull Requests

1. **Fork the Repository:** Create your own fork of this repository.
2. **Create a Branch:** Create a branch for your specific feature or fix (`git checkout -b feature/awesome-new-chapter`).
3. **Make Changes:** Add your text, fix the typo, or update the diagrams. Ensure you follow our writing guidelines (see below).
4. **Commit Changes:** Use clear, descriptive commit messages.
5. **Push:** Push your changes to your fork.
6. **Open a Pull Request:** Create a PR against the `main` branch of this repository. Use the Pull Request template and fill in all the details.

## Writing Guidelines

To maintain the "Microsoft Learn / Docker Docs" level of quality, please adhere to these guidelines:

1. **Target Audience First:** Always remember our audience has *zero* Linux knowledge. Explain acronyms (e.g., BIOS, UEFI, ISO).
2. **Simple English:** Write clearly and concisely. Avoid overly complex sentence structures.
3. **Use Formatting:** 
   - Use `backticks` for commands and file paths.
   - Use **bold** for UI elements you want the user to click.
   - Use GitHub alerts for Tips, Warnings, and Notes.
4. **No Placeholders:** If you add a section, write the full content. Do not leave "TODO" or "Lorem Ipsum" text.
5. **Add Visuals:** If you explain a process, add a placeholder for an image or include a Mermaid diagram.

### Alert Syntax

Use standard GitHub Markdown alerts to draw attention to important information:

```markdown
> [!NOTE]  
> Useful information that users should know, even when skimming.

> [!TIP]  
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]  
> Key information users need to know to achieve their goal.

> [!WARNING]  
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]  
> Advises about risks or negative outcomes of certain actions.
```

## Local Development

If you are modifying the structure or testing GitHub Actions locally, you can use [act](https://github.com/nektos/act) to test workflows before pushing.

Thank you for contributing!
