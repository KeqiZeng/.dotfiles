alias s!='source ~/.zshrc'
alias zshbench='for i in {0..10}; do \time zsh -i -c exit; done'
alias n='neofetch --config ~/.dotfiles/neofetch/config.conf'
alias c='clear'
alias td='tldr'
alias ra='ranger'
alias lg='lazygit'
alias nv='nvim'
alias bi='brew install'
alias bu='brew update'
alias bU='brew upgrade'
alias bs='brew search'
alias bd='brew uninstall'
alias br='brew rmtree'
alias bc='brew cleanup'
alias bl='brew list'
alias cc='noglob cc'
alias dt='delta'
alias tk='tokei'
alias gl='golangci-lint --color always run'
alias lmk='latexmk -pvc'
alias lc='latexmk -c'
alias jn='jupyter notebook'
alias jl='jupyter-lab'
alias pipu='pip install --upgrade'
alias py='python3'
alias condaa='conda activate'
alias condad='conda deactivate'
alias luamake=/usr/local/lua-language-server/3rd/luamake/luamake

# if [ "$(command -v bat)" ]; then
# 	unalias -m 'cat'
# 	alias cat='bat --color always'
# fi

# if [ "$(command -v exa)" ]; then
# 	unalias -m 'ls'
# 	alias ls='exa --color always --icons'
# fi

if [ "(( $+commands[bat] ))" ]; then
    unalias -m 'cat'
    alias cat='bat --color always'
fi

if [ "(( $+commands[exa] ))" ]; then
    unalias -m 'ls'
    alias ls='exa --color always --icons'
fi
