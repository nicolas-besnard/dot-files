for function in ~/.zsh/functions/*; do
  . $function
done

export ZSH_HOME=~/.zsh

_load_settings "$ZSH_HOME/configs"
