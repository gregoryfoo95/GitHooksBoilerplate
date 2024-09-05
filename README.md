# Git Hooks Management

This repository provides scripts to manage Git hooks for your projects, allowing you to easily apply or restore pre-commit hooks.

## Overview

- **apply-hooks.sh:** This script applies a new pre-commit hook to your repository. It automatically backs up any existing hook before applying the new one.
- **restore-hooks.sh:** This script restores a pre-commit hook from a previous backup based on a timestamp.

## Usage

### Applying a Pre-Commit Hook

To apply a new pre-commit hook to your repository, you can use the `apply-hooks.sh` script. This script will back up your existing pre-commit hook and replace it with a new one.

#### Steps:

1. **Run the apply-hooks script:**

    ```bash
    curl -s https://raw.githubusercontent.com/gregoryfoo95/GitHooksBoilerplate/main/sh/typescript/apply-hooks.sh | bash
    ```

    - This command downloads the `apply-hooks.sh` script from the repository and executes it.
    - The script will:
        - Backup the existing pre-commit hook (if any) with a timestamped directory.
        - Apply the new pre-commit hook.

2. **Result:**
    - The new pre-commit hook is now active in your `.git/hooks/` directory.
    - The backup is stored in a directory named `.git/hooks-backup-<TIMESTAMP>`.

### Restoring a Pre-Commit Hook from a Backup

If you want to restore a previous version of the pre-commit hook, you can use the `restore-hooks.sh` script. You will need to specify the timestamp of the backup you wish to restore.

#### Steps:

1. **Identify the Backup:**
    - Backups are stored with a timestamp in the format `YYYYMMDD_HHMMSS`.
    - Example backup directory: `.git/hooks-backup-20230830_144509`

2. **Run the restore-hooks script with the desired timestamp:**

    ```bash
    curl -s https://raw.githubusercontent.com/gregoryfoo95/GitHooksBoilerplate/main/sh/typescript/restore-hooks.sh | bash -s -- -t 20230830_144509
    ```

    - Replace `20230830_144509` with the actual timestamp of the backup you want to restore.
    - The `-t` option specifies the timestamp.

3. **Result:**
    - The pre-commit hook from the specified backup will be restored to the `.git/hooks/` directory.
    - If the specified backup or pre-commit hook does not exist, the script will print an error message.

### Important Notes

- **Backup Format:** Each time you apply a new hook using the `apply-hooks.sh` script, the current pre-commit hook is backed up in the `.git/hooks-backup-<TIMESTAMP>` directory. This ensures you can always revert to a previous version.
- **Timestamps:** Timestamps are generated automatically in the format `YYYYMMDD_HHMMSS`, ensuring unique directory names for each backup.

### Example Usage

1. **Apply a new pre-commit hook:**

    ```bash
    curl -s https://raw.githubusercontent.com/gregoryfoo95/GitHooksBoilerplate/main/sh/typescript/apply-hooks.sh | bash
    ```

2. **Restore a pre-commit hook from a specific timestamp:**

    ```bash
    curl -s https://raw.githubusercontent.com/gregoryfoo95/GitHooksBoilerplate/main/sh/typescript/restore-hooks.sh | bash -s -- -t 20230830_144509
    ```

By following these steps, you can easily manage your Git hooks, applying new ones as needed and restoring previous versions when necessary.
