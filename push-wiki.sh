cd ~/i/huyixi.wiki

# git add + git commit + git push
gac() {
  git add ${2:-.} &&
  git commit -m "$1" &&
  git push
}

gac "chore: Automatic daily backup"
