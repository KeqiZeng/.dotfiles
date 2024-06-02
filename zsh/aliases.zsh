alias s!='source ~/.zshrc'
alias zshbench='for i in {0..10}; do \time zsh -i -c exit; done'
# alias n='neofetch --config ~/.dotfiles/neofetch/config.conf'
alias n='fastfetch'
alias c='clear'
alias td='tldr'
alias ra='ya'
alias lg='lazygit'
alias nv='nvim'

# Homebrew
alias bi='brew install'
alias bic='brew install --cask'
alias fbi='fuzzy_brew_install'
alias fbd='fuzzy_brew_uninstall'
alias fbic='fuzzy_cask_install'
alias fbdc='fuzzy_cask_uninstall'
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
alias latexindent='/opt/homebrew/bin/latexindent'
alias jnb='jupyter notebook'
alias jlab='jupyter-lab'

# usic
alias uplay='usic 1>/dev/null && usic play "$(command find $USIC_PLAYLIST -type f | fzf | xargs -I{} sh -c "command cat "{}" | fzf")"'

# conan
alias conan_install='conan install conanfile.txt --output-folder=build --build=missing'

# python
alias pipu='pip install --upgrade'
alias py='/opt/homebrew/Caskroom/miniforge/base/bin/python3'
# alias pip='/opt/homebrew/Caskroom/miniforge/base/bin/pip'
# alias pip3='/opt/homebrew/Caskroom/miniforge/base/bin/pip3'
alias condaa='conda activate'
alias condad='conda deactivate'
alias luamake=/usr/local/lua-language-server/3rd/luamake/luamake

# scripts
# alias preview='sh ~/scripts/preview.sh'
# alias true-color='sh ~/scripts/true-color.sh'

if [ "(( $+commands[bat] ))" ]; then
    unalias -m 'cat'
    alias cat='bat'
fi

if [ "(( $+commands[exa] ))" ]; then
    unalias -m 'ls'
    alias ls='exa --color always --icons'
fi

# cluser
alias sshcluster='ssh kz35buho@lcluster13.hrz.tu-darmstadt.de'
