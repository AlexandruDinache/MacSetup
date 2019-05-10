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
brew cask install adobe-acrobat-reader
brew cask install flux #night color temperature
brew cask install geektool #customize desktop
brew cask install qbittorrent
brew cask install vlc 
brew cask install whatsapp
brew cask install java
brew cask install ghidra #only for rev eng
brew cask install skype
brew cask install thunderbird
brew cask install nextcloud
brew cask install bitbar #scripts in macos menu bar
brew cask install cheatsheet #cmd keypress show all shortcuts

brew install youtube-dl #download youtube video
brew install httrack #download entire html site
brew install pyenv #multiple python versions
brew install vitorgalvao/tiny-scripts/cask-repair #only to update brew casks
brew install bash #latest version of bash
brew install fortune #random quotations
brew install cowsay #ASCII pictures
brew install git
brew install vcprompt #Show branch on shell prompts
brew install wget
brew install tldr #smaller man pages
brew install mitmproxy #intercept, alter HTTP request

#Install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

#Install visual studio code extensions
curl -O https://raw.githubusercontent.com/AlexandruDinache/MacSetup/master/vs-extensions.txt
while read line; do code --install-extension "$line"; done < vs-extensions.txt
rm vs-extensions.txt

mkdir ~/Projects
mkdir ~/Projects/dev

#Don't commit to github everything && GitConfig
cd ~/Projects/dev
curl -O https://raw.githubusercontent.com/AlexandruDinache/MacSetup/master/.gitignore
curl -O https://raw.githubusercontent.com/AlexandruDinache/MacSetup/master/.gitconfig
cd ~
