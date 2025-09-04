# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 7

ENABLE_CORRECTION="true"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git docker docker-compose git python golang rust)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR="nvim"
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Aliases

alias reload="source ~/.zshrc"
alias v="nvim"
alias vim="nvim"
alias qq="exit"

alias .="../"
alias ..="../.."
alias ...="../../.."
alias ....="../../../.."

alias dl="cd ~/Downloads/"
alias doc="cd ~/Documents/"
alias projects="cd ~/Documents/Code/"

alias zconf="nvim ~/.zshrc"
alias gconf="nvim ~/.gitconfig"
alias tconf="nvim ~/.tmux.conf"

alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias upgradey="sudo apt upgrade -y"

alias myip="curl https://ipinfo.io/json"
alias weather="curl wttr.in"
alias news="newsboat"

alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"

alias gg="lazygit"
alias gd="lazydocker"

# starship
eval "$(starship init zsh)"
