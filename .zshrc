export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Set the default editor to `vim` when connected via SSH, and `nvim` when running locally.
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set the terminal type to `xterm-256color` if not already set, to ensure proper color support in tmux and other terminal applications.
[ -z "$TMUX" ] && export TERM=xterm-256color

# Use `nvim for manpages
export MANPAGER="nvim +Man!"

alias ll="ls -lhap"
alias tmux="tmux -u"
# Start tmux in root with the session named by the user. This helps with the tmux-sessionizer integration
alias tmux-new="tmux new -s $USER -c ~"

# Load nvm (Node Version Manager) if it's installed, allowing you to manage multiple Node.js versions.
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 

export LC_ALL=en_GB.UTF-8 
export LANG=en_GB.UTF-8

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export PATH
