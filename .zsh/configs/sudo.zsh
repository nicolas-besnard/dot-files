export SUDO_PROMPT='\[\e[38m\]%p\[\e[0m\] password: '

# Replace the sudo prompt and add some color to it
alias sudo="sudo -p \"$fg_bold[red][sudo] $fg_no_bold[red]Password:$reset_color \" "
