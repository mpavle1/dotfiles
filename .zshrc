export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export MANPAGER="nvim +Man!"

alias ll="ls -lha"
alias tmux="tmux -u"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

export LC_ALL=en_GB.UTF-8 
export LANG=en_GB.UTF-8

[ -f ~/.zsh_paths ] && source ~/.zsh_paths

