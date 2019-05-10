#Install minimal xcode
xcode-select --install

#Install brew The osx package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew cask install iterm2
brew cask install google-chrome
brew cask install firefox
brew install bash # latest version of bash
brew install fortune
brew install cowsay 
brew install git
brew install vcprompt
brew install wget
brew cask install spectacle
brew cask install alfred #better search than spotli
brew cask install visual-studio-code
mkdir ~/Projects
mkdir ~/Projects/dev
