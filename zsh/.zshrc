# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java
export JAVA_HOME="/usr/lib/jvm/java-1.18.0-openjdk-amd64/"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Add wisely.
plugins=(git command-not-found nvm node docker docker-compose history ubuntu vscode tmux)

source $ZSH/oh-my-zsh.sh

# Alias
alias :q='exit'
alias vim='nvim'
alias cls='clear'
alias weather='curl wttr.in'
alias news='newsboat'

alias shutdown='sudo shutdown -h now'

alias zshconf='vim ~/.zshrc'
alias gconf='vim ~/.gitconfig'
alias vconf='vim ~/.config/nvim/init.vim'
alias tmuxconf='vim ~/.tmux.conf'
alias kittyconf='vim ~/.config/kitty/kitty.conf'
alias vv='vconf'
alias vsnip='cd ~/.config/nvim/snippets; vim .'

alias upall='sudo apt update && sudo snap refresh'
alias upallu='sudo apt update && sudo apt upgrade -y && sudo snap refresh'

alias .='cd ..'
alias ..='cd ../../'
alias ...='cd ../../../'

alias dl='cd ~/Descargas'
alias docs='cd ~/Documentos'
alias vault='cd ~/Documentos/Vault'

alias g='git'
alias v='vim'
alias h='history'

alias cp='cp -i'
alias mv='mv -i'
alias untar='tar xvf'
