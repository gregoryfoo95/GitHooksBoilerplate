#!/bin/bash

# Define directories
GIT_HOOKS_DIR="$(pwd)/.git/hooks"
BACKUP_DIR_BASE="$(pwd)/.git/hooks-backup"

# Function to display usage instructions
usage() {
    echo "Usage: $0 -t TIMESTAMP"
    echo "  -t TIMESTAMP  Specify the timestamp of the backup to restore (format: YYYYMMDD_HHMMSS)"
    exit 1
}

# Parse the timestamp argument
while getopts ":t:" opt; do
    case $opt in
        t)
            TIMESTAMP=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            usage
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            usage
            ;;
    esac
done

# Check if timestamp was provided
if [ -z "$TIMESTAMP" ]; then
    echo "Error: No timestamp provided."
    usage
fi

# Construct the backup directory path
BACKUP_DIR="${BACKUP_DIR_BASE}-${TIMESTAMP}"

# Check if the specified backup exists
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Error: No backup found for timestamp $TIMESTAMP."
    exit 1
fi

# Restore the pre-commit hook from the specified backup
if [ -f "$BACKUP_DIR/pre-commit" ]; then
    cp "$BACKUP_DIR/pre-commit" "$GIT_HOOKS_DIR/pre-commit"
    chmod +x "$GIT_HOOKS_DIR/pre-commit"
    echo "Pre-commit hook restored from backup $BACKUP_DIR."
else
    echo "Error: No pre-commit hook found in backup $BACKUP_DIR."
    exit 1
fi
