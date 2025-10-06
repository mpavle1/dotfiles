export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

[ -z "$TMUX" ] && export TERM=xterm-256color

export MANPAGER="nvim +Man!"

alias ll="ls -lhap"
alias tmux="tmux -u"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

export LC_ALL=en_GB.UTF-8 
export LANG=en_GB.UTF-8

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi

export PATH="$HOME/bin:$PATH"

export PATH
