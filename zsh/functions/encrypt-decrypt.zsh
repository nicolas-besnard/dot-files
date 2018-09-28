encrypt() {
  tar -cf - $1 | openssl aes-128-cbc -salt -out backup.tar.aes
}

decrypt() {
  openssl aes-128-cbc -d -salt -in $1 | tar -x -f -
}
