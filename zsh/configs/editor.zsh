export VISUAL=vim 
export EDITOR=$VISUAL

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR=$VISUAL
fi

