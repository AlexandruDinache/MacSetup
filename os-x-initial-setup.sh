#Install minimal xcode
xcode-select --install

#Install brew The osx package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

brew cask install iterm2 #better than terminal
brew cask install google-chrome
brew cask install firefox
brew cask install insomnia #REST client for API projects
brew cask install spectacle #Move and resize windows with ease using keyboard shortcuts
brew cask install alfred #better search than spotli
brew cask install visual-studio-code
brew cask install lulu #firewall
brew cask install wireshark #view network packets
brew cask install teamviewer 
brew cask install coconutbattery #more info about battery health
brew cask install bowtie #control music with API
brew cask install discord #chat
brew cask install hyperswitch #show preview on cmd tab

brew install bash #latest version of bash
brew install fortune #random quotations
brew install cowsay #ASCII pictures
brew install git
brew install vcprompt #Show branch on shell prompts
brew install wget
brew install tldr #smaller man pages

mkdir ~/Projects
mkdir ~/Projects/dev
