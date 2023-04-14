# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="fino"

export TMUX_CONFIG="~/.config/tmux/tmux.conf"
TMUX_SATUS_BAR=~/.config/tmux/TMUX_SATUS_BAR

# Vi->nvim if nvim installed
if type nvim > /dev/null; then
	export visual=nvim
	export VIMCONFIG=~/.config/nvim
	export VIMDATA=~/.local/share/nvim
else
	export VISUAL=vim
fi

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colorize grc zsh-autosuggestions zsh-syntax-highlighting tmux)
# colorize settings
ZSH_COLORIZE_STYLE="colorful"

# init tmux plugin to run on launch
ZSH_TMUX_AUTOSTART=true
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {

  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# vi->nvim if nvim installed
if type "nvim" > /dev/null; then
	alias vim='nvim'
	alias vi='nvim'
fi

alias fullCheck="yarn test:ci --coverage && yarn lint --fix && yarn typecheck"
alias add="git add -p ."
alias adds="git add ."
alias gst="git status"
alias gcm="git commit -m "
alias push='git push -u origin $(current_branch)'
alias master="git checkout master"
alias masterp="git checkout master && git pull"
alias develop="git checkout develop"
alias developp="git checkout develop && git pull"
alias branch="git checkout -b "
alias gck="git checkout "
alias gckm="git checkout -"
alias pull="git pull"
alias pjt="cd hemea/travauxlib"
alias zshcode="code ~/.zshrc"
alias deploy_pro="heroku pipelines:promote -a travauxlib-pro-staging"     
alias deploy_api="heroku pipelines:promote -a travauxlib-api-staging"   
alias deploy_app="heroku pipelines:promote -a travauxlib-app-staging"  
alias deploy_admin="heroku pipelines:promote -a travauxlib-admin-staging"
alias cat='ccat'
alias ls='exa -a --color=always --group-directories-first --icons' #my preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -a --icons | egrep "^\."'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# Open file selected via fzf in vim
function vimo() {
	local fname
	fname=$(fzf) || return
	vim "$fname"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Archives
function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}
alias nmap='grc nmap'
alias cat='ccat'
alias ls='exa -a --color=always --group-directories-first --icons' #my preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -a --icons | egrep "^\."'
alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
alias rustscan='docker run -it --rm --name rustscan rustscan/rustscan:1.10.0'
alias server='python3 -m http.server'
alias htbvpn='sudo openvpn /home/kali/Downloads/lab_f3nr1r.ovpn'
alias htbrvpn='sudo openvpn /home/kali/Downloads/competitive_f3nr1r.ovpn'
alias boxes='cd /home/kali/htb/boxes'
alias b64='base64'
alias b64d='base64 -d'
eb64(){echo "${1}" | base64}
eb64d(){echo "${1}" | base64 -d}

alias php-reverse-shell="cp /usr/share/webshells/php/php-reverse-shell.php ."
# Gobuster directory fuzzing
# Usage: gobusterit <url>
gobusterit() {
    gobuster dir -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt | tee gobuster.txt
}
# Feroxbuster directory fuzzing
# Usage: feroxbusterit <url>
feroxbusterit() {
    feroxbuster -u $1 -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt | tee feroxbuster.txt
}

#alias vim to neovim
alias vim='nvim'

alias cme='crackmapexec'
# vi->nvim if nvim installed
if type "nvim" > /dev/null; then
	alias vim='nvim'
	alias vi='nvim'
fi


alias c='xclip -selection clipboard'

server() {
	if [[ $2 ]];then
		python3 -m http.server $1 --directory $2
	else
		python3 -m http.server $1
	fi
}

rs() {
	curl https://reverse-shell.sh/$1:$2
}

vpn-up() {
	sudo pkill openvpn
	sudo openvpn /home/kavi/Documents/HTB/lab_kavigihan.ovpn
}

htb-init() {
	if [[ $1 ]]; then			
		mkdir -p /home/kavi/Documents/HTB/$1/files
		mkdir -p /home/kavi/Documents/HTB/$1/exploits
		cd /opt/drop
		/usr/bin/python3 -m http.server 8080 > /dev/null 2>&1 &
		echo $! > /home/kavi/Documents/HTB/$1/.server.pid
		cd /home/kavi/Documents/HTB/$1
		clear
	else
		echo 'Usage: htb-init Moderators'
	fi
}


htb-setup() {
	/home/kavi/Documents/scripts/htb-setup.sh
}


nmap-full() {
	nmap -p- -sC -sV -A --min-rate=400 --min-parallelism=512 -vv $1
}


ffuf-dir() {
	ffuf -u $1 -w /usr/share/wordlists/dirb/big.txt ${@: 2};
}


ffuf-vhost() {
	ffuf -H "Host: FUZZ.$1" -u http://$1 -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-20000.txt ${@: 2};
}

fx() {
	feroxbuster -u $1 -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-small.txt ${@: 2};
}


lst(){
	rlwrap nc -lvnp $1
}

shell() {

	if [[ $1 ]]; then
		port=$1
	else
		port=9001
	fi

	stty raw -echo; (echo 'python3 -c "import pty;pty.spawn(\"/bin/bash\")" || python -c "import pty;pty.spawn(\"/bin/bash\")"' ;echo "stty$(stty -a | awk -F ';' '{print $2 $3}' | head -n 1)"; echo reset;cat) | nc -lvnp $port && reset

}

urlencode() {
        python3 -c "import sys; from urllib.parse import quote; print(quote(sys.stdin.read().strip()));"
}

urldecode() {
        python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read().strip()));"
}

md5() {
	python3 -c 'import hashlib,sys; print(hashlib.md5(sys.stdin.read().encode()).hexdigest())'
}

##### TMUX options

tsa() {
	status_bar=$(cat $TMUX_SATUS_BAR)
	tmux set-option -g status-right "$1 $status_bar"
	echo "$1 $status_bar" > $TMUX_SATUS_BAR
}

tsd() {
	echo '[#{session_name}]' > $TMUX_SATUS_BAR
	status_bar=$(cat $TMUX_SATUS_BAR)
	tmux set-option -g status-right "$status_bar"
}
