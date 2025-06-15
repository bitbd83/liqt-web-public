#!/bin/bash

# Git Auto-Force-Push Script
# This script adds all changes, commits with a timestamp, and force-pushes to the current branch

# Check if we're in a Git repository
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    echo "Error: Not in a Git repository"
    exit 1
fi

# Get current branch name
current_branch=$(git branch --show-current)

# Generate timestamp
timestamp=$(date +"%Y-%m-%d %H:%M:%S")

# Perform Git operations
echo "Running Git operations on branch '$current_branch'..."
git pull && \
git add . && \
git commit -s -m "Update: $timestamp" && \
git push --force origin "$current_branch"

# Check if operations were successful
if [ $? -eq 0 ]; then
    echo "Successfully force-pushed to $current_branch"
else
    echo "Error occurred during Git operations"
    exit 1
fi
