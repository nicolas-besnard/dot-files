ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew tap caskroom/versions

brew cask install google-chrome
brew cask install firefox
brew cask install iterm2
brew cask install smcfancontrol
brew cask install vlc
brew cask install alfred
brew cask install rubymine
brew cask install appcleaner
brew install git-extras
brew install python
brew install tmux
brew install reattach-to-user-namespace
brew cask alfred link
brew cask cleanup
