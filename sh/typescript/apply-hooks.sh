#!/bin/bash

# Define URL to the pre-commit hook file
PRE_COMMIT_HOOK_URL="https://raw.githubusercontent.com/gregoryfoo95/GitHooksBoilerplate/main/sh/typescript/hooks/pre-commit"

# Define the hooks directory
GIT_HOOKS_DIR="$(pwd)/.git/hooks"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$(pwd)/.git/hooks-backup-typescript-$TIMESTAMP"

# Backup existing pre-commit hook if it exists
if [ -f "$GIT_HOOKS_DIR/pre-commit" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$GIT_HOOKS_DIR/pre-commit" "$BACKUP_DIR/pre-commit"
    echo "Existing pre-commit hook has been backed up to $BACKUP_DIR."
fi

# Download the new pre-commit hook
curl -o "$GIT_HOOKS_DIR/pre-commit" "$PRE_COMMIT_HOOK_URL"
chmod +x "$GIT_HOOKS_DIR/pre-commit"

echo "New TypeScript ESLint pre-commit hook has been applied successfully!"