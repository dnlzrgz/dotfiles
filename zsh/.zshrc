# Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Load nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


# Poetry
export PATH="$HOME/.local/bin:$PATH"


# User configuration
export EDITOR="nvim"
export PATH=$HOME/bin:/usr/local/bin:$PATH


# oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# Enable command auto-correction.
ENABLE_CORRECTION="true"


# Plugins
plugins=(git python poetry pyenv node nvm npm docker docker-compose)


source $ZSH/oh-my-zsh.sh


# Aliases
alias reload="source ~/.zshrc"
alias cls="clear"

alias vim="nvim"
alias v="nvim"
alias :q="exit"

alias ..="../.."
alias ...="../../.."
alias ....="../../../.."

alias dl="cd ~/Downloads"
alias docs="cd ~/Documents"
alias codir="cd ~/Documents/Code"

alias vconf="nvim ~/.config/nvim/init.lua"
alias zconf="nvim ~/.zshrc"
alias gconf="nvim ~/.gitconfig"
alias kconf="nvim ~/.config/kitty/kitty.conf"

alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias upgradey="sudo apt upgrade -y"
alias nvmup="nvm install node"

alias pon="poetry new"
alias poi="poetry init"
alias poa="poetry add"
alias poad="poetry add --group dev"
alias pos="poetry shell"

alias ginit="git init"

alias s="kitty +kitten ssh"
alias myip="curl https://ipinfo.io/json"

alias weather="curl wttr.in"
alias news="newsboat"


# cht.sh
cht () {
	curl "https://cht.sh/$1/$2"
}

chtpy () {
	curl "https://cht.sh/python/$1"
}

# Pomodoro
alias lolcat="lolcat-rs"

declare -A pomo_options
pomo_options["work"]="25"
pomo_options["break"]="5"

pomodoro () {
	if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
	val=$1
	echo $val | lolcat
	timer ${pomo_options["$val"]}m
	spd-say "'$val' session done"
	fi
}

alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

# `p10k configure`
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
