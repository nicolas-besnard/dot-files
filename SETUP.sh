echo "##     ZSH"
ln -sf "$(pwd)/zshrc" ~/.zshrc
ln -sf "$(pwd)/zsh" ~/.zsh

echo "##     TMUX"
ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf
ln -sf "$(pwd)/tmux" ~/.tmux
sh tmux.sh

echo "##     GIT"
ln -sf "$(pwd)/gitconfig" ~/.gitconfig
ln -sf "$(pwd)/gitignore_global" ~/.gitignore_global
ln -sf "$(pwd)/gitmessage" ~/.gitmessage



ln -sf "$(pwd)/gemrc"/ ~/.gemrc
