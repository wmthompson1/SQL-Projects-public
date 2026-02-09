# Git Cheat Sheet

A quick reference guide for common Git commands.

## 🚀 Getting Started

*   **Initialize a new repository:**
    ```bash
    git init
    ```

*   **Clone an existing repository:**
    ```bash
    git clone <url>
    ```

## 📝 Prepare to Commit

*   **Check the status of your changes:**
    ```bash
    git status
    ```

*   **Add an untracked file or stage changes:**
    ```bash
    git add <file>
    ```

*   **Stage all changes in the current directory:**
    ```bash
    git add .
    ```

*   **Unstage a file (move from staging to working directory):**
    ```bash
    git reset <file>
    ```

*   **View differences between staged and unstaged changes:**
    ```bash
    git diff
    ```

*   **View differences between the staging area and the last commit:**
    ```bash
    git diff --staged
    ```

## 💾 Make Commits

*   **Commit staged changes (opens editor for message):**
    ```bash
    git commit
    ```

*   **Commit staged changes with a message:**
    ```bash
    git commit -m "Your message here"
    ```

*   **Commit all unstaged changes with a message (skips `git add .`):**
    ```bash
    git commit -am "Your message here"
    ```

*   **Amend the last commit:**
    ```bash
    git commit --amend
    ```

## 🌱 Branch Management

*   **List all branches:**
    ```bash
    git branch
    ```

*   **Create a new branch and switch to it:**
    ```bash
    git switch -c <branch-name>
    # OR (older command)
    git checkout -b <branch-name>
    ```

*   **Switch to an existing branch:**
    ```bash
    git switch <branch-name>
    # OR (older command)
    git checkout <branch-name>
    ```

*   **Merge a branch into the current active branch:**
    ```bash
    git merge <branch-name>
    ```

*   **Delete a local branch:**
    ```bash
    git branch -d <branch-name>
    ```

## 🤝 Remotes & Collaboration

*   **List all remote connections:**
    ```bash
    git remote -v
    ```

*   **Add a new remote repository:**
    ```bash
    git remote add <name> <url>
    ```

*   **Fetch changes from a remote (does not merge):**
    ```bash
    git fetch <remote>
    ```

*   **Pull changes from a remote and merge:**
    ```bash
    git pull <remote> <branch>
    ```

*   **Push local changes to a remote repository:**
    ```bash
    git push <remote> <branch>
    ```

## ⏪ Undoing Things & Discarding Changes

*   **Discard changes in a specific file in the working directory:**
    ```bash
    git restore <file>
    ```

*   **Restore a file to how it was in a specific commit:**
    ```bash
    git restore <file> --source <commit>
    ```

*   **Create a new commit that undoes the changes of a previous commit:**
    ```bash
    git revert <commit>
    ```

*   **Reset the current HEAD to a previous state (use with caution):**
    ```bash
    git reset <commit>
    ```
