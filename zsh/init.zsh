for function in ~/.zsh/functions/*; do
  . $function
done

export ZSH_HOME=~/.zsh

_load_settings "$ZSH_HOME/configs"
_load_if_exists "$HOME/.zshrc.freelancing"
