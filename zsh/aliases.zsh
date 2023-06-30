alias s!='source ~/.zshrc'
alias zshbench='for i in {0..10}; do \time zsh -i -c exit; done'
alias n='neofetch --config ~/.dotfiles/neofetch/config.conf'
alias c='clear'
alias td='tldr'
alias ra='ranger'
alias lg='lazygit'
alias nv='nvim'

# Homebrew
alias bi='brew install'
alias bu='brew upgrade'
alias bs='brew search'
alias bd='brew uninstall'
alias br='brew rmtree'
alias bc='brew cleanup'
alias bl='brew list'

# kitty
if [ "$TERM" = "xterm-kitty" ]; then
  alias icat='kitty +kitten icat'
  alias ssh='kitty +kitten ssh'
  alias diff='kitty +kitten diff'
fi

alias cc='noglob cc'
alias tk='tokei'
alias golint='golangci-lint --color always run'
alias lmk='latexmk -pvc'
alias lc='latexmk -c'
alias jnb='jupyter notebook'
alias jlab='jupyter-lab'

# python
alias pipu='pip install --upgrade'
alias py='/opt/homebrew/Caskroom/miniforge/base/bin/python3'
alias condaa='conda activate'
alias condad='conda deactivate'
alias luamake=/usr/local/lua-language-server/3rd/luamake/luamake

# scripts
alias preview='sh ~/scripts/preview.sh'
alias true-color='sh ~/scripts/true-color.sh'

if [ "(( $+commands[bat] ))" ]; then
    unalias -m 'cat'
    alias cat='bat'
fi

if [ "(( $+commands[exa] ))" ]; then
    unalias -m 'ls'
    alias ls='exa --color always --icons'
fi
