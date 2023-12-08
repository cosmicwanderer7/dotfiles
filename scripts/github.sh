#!/bin/bash

# GitHub username
GITHUB_USERNAME="username"

# GitHub personal access token
GITHUB_TOKEN="token"

cd Documents

# repository name
read -p "Enter the desired repository name: " REPO_NAME

mkdir "$REPO_NAME"
cd "$REPO_NAME" || exit 1

git init -b main

echo "# $REPO_NAME" > README.md
git add README.md
git commit -m "Initial commit"

# Suppress the output from curl
curl -s -u "$GITHUB_USERNAME:$GITHUB_TOKEN" https://api.github.com/user/repos -d '{"name":"'"$REPO_NAME"'", "private": false}' > /dev/null

git remote add origin "git@github.com:$GITHUB_USERNAME/$REPO_NAME.git"
git branch -M main

git push -u origin main

code .
