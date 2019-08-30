git_dig() {
  git log \
    --pretty=format:'%Cred%h%Creset - %Cgreen(%ad)%Creset - %s %C(bold blue)<%an>%Creset' \
    --abbrev-commit \
    --date=short -G"$1" -- $2
}

