#!/bin/bash

repos=(
    "$HOME/i/blog"
    "$HOME/i/weekly"
    "$HOME/i/huyixi.wiki"
    "$HOME/i/hello-world"
    "$HOME/i/software-engineer-interview-guide"
)

for repo in "${repos[@]}"; do
    echo "Processing repository: $repo"

    cd "$repo" || { echo "Failed to change directory to $repo"; continue; }

    git add ${1:-.} &&
    git commit -m "chore: $(date '+%Y-%m-%d %H:%M') update" &&
    git push

    echo "Finished processing $repo"
    echo "------------------------"
done

echo "Running push-to-repo.sh at $(date)" >> /Users/huyixi/i/Automator/push-to-repo.log
