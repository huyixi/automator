cd ~/i/hello-world

git add ${2:-.} &&
git commit -m "chore: $(date '+%Y-%m-%d %H:%M') update" &&
git push
