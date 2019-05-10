shopt -s histappend #append history

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#Set default blocksize for ls, df, du
export BLOCKSIZE=1k

#Set history
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

#Color variables
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#Set prompt format
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(vcprompt)$ "

#Set colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export GREP_OPTIONS='--color=auto'

#Set path
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH=$PATH:$HOME/Projects/bin #for own binaries

#Set default editor
export EDITOR=/usr/bin/nano

#Set command alias
alias ll='ls -al'
alias ls='ls -GFh'
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias o='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias myip='curl ifconfig.co'               # myip:         Public facing IP Address
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias topforever='top -l 9999999 -s 10 -o cpu'
alias fdev = "cd ~/Projects/dev"
alias projects = "cd ~/Projects"

cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'

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

function mkcd()
{
	mkdir $1 && cd $1
}

fortune | cowsay -f tux

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
