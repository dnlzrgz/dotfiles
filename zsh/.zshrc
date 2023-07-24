# Load Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Load pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Poetry
export PATH="$HOME/.local/bin:$PATH"

# User config
export EDITOR="vim"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# omz installation.
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

alias v="nvim"
alias vim="nvim"
alias :q="exit"

alias ..="../.."
alias ...="../../.."
alias ....="../../../.."

alias dl="cd ~/Downloads"
alias code="cd ~/Documents/Code/"

alias zconf="nvim ~/.zshrc"
alias gconf="nvim ~/.gitconfig"
alias vconf="nvim ~/.config/nvim/init.lua"
alias tconf="nvim ~/.tmux.conf"

alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias upgradey="sudo apt upgrade -y"
alias nvmup="nvm install node"
alias flatup="flatpak update"
alias snapup="snap refresh"

alias pon="poetry new"
alias poi="poetry init"
alias poa="poetry add"
alias poad="poetry add --group dev"
alias pos="poetry shell"

alias d="docker"
alias di="docker image ls"
alias dip="docker image pull"
alias dirm="docker image rm"
alias dipr="docker image prune"
alias dc="docker-compose"
alias dcu="docker-compose up -d --build"

alias myip="curl https://ipinfo.io/json"
alias weather="curl wttr.in"

alias shutdown="sudo shutdown -h now"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
