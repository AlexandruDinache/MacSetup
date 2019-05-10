shopt -s histappend
complete -cf sudo

#Custom title iterm
export PROMPT_COMMAND='echo -ne "\033]0;$PWD\007"'

#Change history search binds
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Set default blocksize for ls, df, du
export BLOCKSIZE=1k

#Set history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#Set colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'

#Set path
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH=$PATH:$HOME/Projects/bin #for own binaries

#Set prompt format
export PS1='\n\[\e[1;37m\]|-- \[\e[1;32m\]\u\[\e[0;39m\]@\[\e[1;36m\]\h\[\e[0;39m\]:\[\e[1;33m\]\w\[\e[0;39m\]\[\e[1;35m\]$(vcprompt " (%s)")\[\e[0;39m\] \[\e[1;37m\]--|\[\e[0;39m\]\n\$ '

#Set default editor
export EDITOR=/usr/bin/nano

#Set command alias
alias ll='ls -al'
alias ls='ls -GFh'
alias ~="cd ~"                              
alias c='clear'                             
alias o='open -a Finder ./'                 
alias myip='curl ifconfig.co'
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias flushDNS='dscacheutil -flushcache'            
alias openPorts='sudo lsof -i | grep LISTEN'        
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias topforever='top -l 9999999 -s 10 -o cpu'
alias updatebash="curl https://raw.githubusercontent.com/AlexandruDinache/MacSetup/master/.bash_profile > ~/.bash_profile && source ~/.bash_profile"
alias vremea="curl -s 'http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|RO|RO010|BUCURESTI' | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

cd() { builtin cd "$@"; ll; }               

#Functions
ii() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Current network location :$NC " ; scselect
    echo -e "\n${RED}Public facing IP Address :$NC " ;myip
    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
    echo
}

function mkcd() {
	mkdir $1 && cd $1
}

# Generate a ssh key
function sshKeyGen(){
echo "Name of the Key: ";
read name;
echo "Email associated: ";
read email;
`ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_$name -C "$email"`;
ssh-add -K ~/.ssh/id_rsa_$name
pbcopy < ~/.ssh/id_rsa_$name.pub;
echo "SSH Key copied in your clipboard";
}

# Generates a random password
function randpassw() {
	if [ -z $1 ]; then
		MAXSIZE=10
	else
		MAXSIZE=$1
	fi
	array1=( 
	q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D 
	F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0 
	\! \@ \$ \% \^ \& \* \! \@ \$ \% \^ \& \* \@ \$ \% \^ \& \* 
	) 
	MODNUM=${#array1[*]} 
	pwd_len=0 
	while [ $pwd_len -lt $MAXSIZE ] 
	do 
	    index=$(($RANDOM%$MODNUM)) 
	    echo -n "${array1[$index]}" 
	    ((pwd_len++)) 
	done 
	echo 
}

#Open new tab (iterm) from terminal
function newtab () {
  [ "$(uname -s)" != "Darwin" ] && return
  local cmd=""
  local cdto="$PWD"
  local args="$@"

  if [ -d "$1" ]; then
    cdto="$(cd "$1"; pwd)"
    args="${@:2}"
  fi

  if [ -n "$args" ]; then
    cmd="; $args"
  fi

  osascript &>/dev/null <<EOF
    tell application "iTerm"
      tell current window
        set newTab to (create tab with default profile)
        tell newTab
          tell current session
            write text "cd \"$cdto\"$cmd"
          end tell
        end tell
      end tell
    end tell
EOF
}

#Open new window (iterm) from terminal
function newwin () {
  [ "$(uname -s)" != "Darwin" ] && return
  osascript &>/dev/null <<EOF
    tell application "iTerm2"
      set newWindow to (create window with default profile)
      tell newWindow
        select
      end tell
    end tell
EOF
}

#Develop stuff
alias httpStatus="curl -w %{http_code} -s --output /dev/null $1"
httpHeaders () { /usr/bin/curl -I -L $@ ; }
httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }

fortune | cowsay -f tux

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
