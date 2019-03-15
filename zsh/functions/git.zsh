gitb() {
  local branches branch
  branches=$(git branch -vva) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Display branches use FZF to pick a branch
fbr() {
  local branches branch
  branches=$(git branch) &&
    branch=$(echo "$branches" | fzf-tmux -d 15 +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
}
