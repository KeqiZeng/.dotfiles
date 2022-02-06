alias s!='source ~/.zshrc'
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
alias jn='jupyter notebook'
alias condaa='conda activate'
alias condad='conda deactivate'
alias luamake=/usr/local/lua-language-server/3rd/luamake/luamake

if [ "$(command -v bat)" ]; then
	unalias -m 'cat'
	alias cat='bat --color always'
fi