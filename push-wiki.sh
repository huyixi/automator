cd ~/i/huyixi.wiki

# git add + git commit + git push
gac() {
  git add ${2:-.} &&
  git commit -m "chore: $(date '+%Y-%m-%d %H:%M') update" &&
  git push
}

gac
