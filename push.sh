#!/bin/bash

# Variables
REPO_PATH="/mnt/c/Users/DELL/Desktop/iac-ec2"
FILE_PATH="test.txt"
UPDATE_TEXT="This is an automated update."
COMMIT_MESSAGE="Automated update to $FILE_PATH"

# Personal Access Token (replace YOUR_TOKEN with your actual token)
TOKEN="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"

# Change directory to the Git repository
cd "$REPO_PATH" || { echo "Error: Unable to change directory to $REPO_PATH"; exit 1; }

# Add content to the file
echo -e "\n$UPDATE_TEXT" >> "$FILE_PATH"

# Commit changes
git add .
git commit -m "$COMMIT_MESSAGE"

# Push changes to the remote repository
#git push origin main
git push https://asad059:$TOKEN@github.com/asad059/iac-ec2.git main