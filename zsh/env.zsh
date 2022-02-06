# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# batconfig
export BAT_CONFIG_PATH="$HOME/.dotfiles/bat/bat.conf"

# autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"

# zsh-vi-mode
export ZVM_VI_SURROUND_BINDKEY=s-prefix

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPROXY=goproxy.cn

# editor
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='nvim'
fi
