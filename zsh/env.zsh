export XDG_CONFIG_HOME=$HOME/.config

#homebrew
export PATH=/opt/homebrew/bin:$PATH

# ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# pyenv
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# batconfig
export BAT_CONFIG_PATH="$HOME/.dotfiles/bat/bat.conf"

# uz
export UZ_USE_EXA=true
export UZ_USE_BAT=true

# autosuggestions
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#888888"

# zsh-vi-mode
export ZVM_VI_SURROUND_BINDKEY=s-prefix

# tealdeer
export TEALDEER_CONFIG_DIR=$XDG_CONFIG_HOME/tealdeer

# golang
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# export GOPROXY=goproxy.cn

# mason for neovim
export MASON_BIN=$HOME/.local/share/nvim/mason/bin
export PATH=$PATH:$MASON_BIN

# java
export JDT_PATH=$HOME/jdt-language-server/bin
export PATH=$PATH:$JDT_PATH

# rust
export RUSTUP_HOME=$HOME/rust/.rustup
export CARGO_HOME=$HOME/rust/.cargo

# editor
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='vim'
else
 export EDITOR='nvim'
fi
