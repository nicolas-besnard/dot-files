fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n$fmt\\n" "$@"
}

fancy_echo "## BREW"

if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
  curl -fsS \
    'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
fi

brew update --force
brew bundle --file=- <<EOF
  tap 'github/gh'
  tap 'heroku/brew'
  tap "thoughtbot/formulae"
  tap "homebrew/cask"
  tap "homebrew/cask-fonts"
  tap "homebrew/cask-versions"
  tap "homebrew/services"
  tap "universal-ctags/universal-ctags"

  cask "1password"
  cask "1password-cli"
  cask "docker"
  cask "font-jetbrains-mono"
  cask "firefox"
  cask "iterm2"
  cask "vlc"
  cask "alfred"
  cask "rubymine"
  cask "appcleaner"
  cask "spotify"
  cask "charles"
  cask "keepingyouawake"
  cask "wkhtmltopdf"

	# Unix
  brew "httpie"
	brew "universal-ctags", args: ["HEAD"]
	brew "openssl"
	brew "rcm"
	brew "reattach-to-user-namespace"
	brew "the_silver_searcher"
	brew "tmux"
	brew "vim"
	brew "watchman"
	brew "zsh"
  brew "fzf"
  brew "git-lfs"
  brew "git-extras"
  brew "exa" # better ls
  brew "diff-so-fancy" # better git diff
  brew "zplug"
  brew "htop"
  brew "terraform"

	# Heroku
	# brew "heroku/brew/heroku"
	# brew "parity"

	# GitHub
	brew "hub"

	# Image manipulation
	# brew "imagemagick"

	# Programming language prerequisites and package managers
	brew "libyaml" # should come after openssl
	brew "coreutils"
	brew "yarn"
	# cask "gpg-suite"

	# Databases
	# brew "postgres", restart_service: :changed
	# brew "redis", restart_service: :changed
EOF

fancy_echo "## ASDF"

if [ ! -d "$HOME/.asdf" ]; then
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.0
fi

source "$HOME/.asdf/asdf.sh"

add_or_update_asdf_plugin() {
  local name="$1"
  local url="$2"

  if ! asdf plugin-list | grep -Fq "$name"; then
    asdf plugin-add "$name" "$url"
  else
    asdf plugin-update "$name"
  fi
}

install_asdf_language() {
  local language="$1"
  local version
  version="$(asdf list-all "$language" | grep -v "[a-z]" | tail -1)"

  if ! asdf list "$language" | grep -Fq "$version"; then
    asdf install "$language" "$version"
    asdf global "$language" "$version"
  fi
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
  fi
}

add_or_update_asdf_plugin "ruby" "https://github.com/asdf-vm/asdf-ruby.git"
add_or_update_asdf_plugin "nodejs" "https://github.com/asdf-vm/asdf-nodejs.git"

fancy_echo "Installing latest Ruby ..."
install_asdf_language "ruby"
gem update --system
gem_install_or_update "bundler"
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

fancy_echo "Installing latest Node ..."
bash "$HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring"
install_asdf_language "nodejs"

defaults write com.apple.screencapture location ~/Desktop/screenshots
killall SystemUIServer

RCRC=rcrc rcup -v

# echo "##     ZSH"
# ln -sf "$(pwd)/zshrc" ~/.zshrc
# ln -sf "$(pwd)/zsh" ~/.zsh
#
# echo "##     TMUX"
# ln -sf "$(pwd)/tmux.conf" ~/.tmux.conf
# ln -sf "$(pwd)/tmux" ~/.tmux
# sh tmux.sh
#
# echo "##     GIT"
# ln -sf "$(pwd)/gitconfig" ~/.gitconfig
# ln -sf "$(pwd)/gitignore_global" ~/.gitignore_global
# ln -sf "$(pwd)/gitmessage" ~/.gitmessage
#
# ln -sf "$(pwd)/gemrc"/ ~/.gemrc
