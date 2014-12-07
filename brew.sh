ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew doctor
brew install caskroom/cask/brew-cask

brew cask install google-chrome
brew cask install skype
brew cask install iterm2
brew cask install vlc
brew cask install alfred
brew cask install appcode
brew cask install webstorm
brew cask install rubymine
brew cask alfred link
brew cask cleanup