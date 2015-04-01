ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor
brew install caskroom/cask/brew-cask
brew tap caskroom/versions

brew cask install google-chrome
brew cask install firefox
brew cask install skype
brew cask install iterm2
brew cask install vlc
brew cask install alfred
brew cask install appcode
brew cask install webstorm
brew cask install rubymine
brew cask install sublime-text3
brew cask install virtualbox
brew install python
brew install emacs --use-git-head --cocoa --srgb
brew install cask
brew install docker
brew cask alfred link
brew cask install bettertouchtool
brew cask cleanup
