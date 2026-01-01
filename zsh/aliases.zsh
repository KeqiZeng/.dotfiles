alias s!='source ~/.zshrc'
alias zshbench='for i in {0..10}; do \time zsh -i -c exit; done'
alias n='fastfetch'
alias c='clear'
alias td='tldr'
alias ra='ya'
alias lg='lazygit'
alias nv='nvim'

# Homebrew
alias bi='brew install'
alias bic='brew install --cask'
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

alias tk='tokei'
alias golint='golangci-lint --color always run'
alias lmk='latexmk -pvc'
alias lc='latexmk -c'
alias latexindent='/opt/homebrew/bin/latexindent'
alias jnb='jupyter notebook'
alias jlab='jupyter-lab'

# python
alias pipu='pip install --upgrade'
alias mba='mamba activate'
alias mbd='mamba deactivate'
alias mmb='micromamba'
alias mmba='micromamba activate'
alias mmbd='micromamba deactivate'

# mujoco
alias mujoco='/Applications/MuJoCo.app/Contents/MacOS/simulate'
alias mujoco_basic='/Applications/MuJoCo.app/Contents/MacOS/basic'
alias mujoco_compile='/Applications/MuJoCo.app/Contents/MacOS/compile'

# scripts
alias preview='sh ~/scripts/preview.sh'
alias true-color='sh ~/scripts/true-color.sh'

if [ "(( $+commands[bat] ))" ]; then
    unalias -m 'cat'
    alias cat='bat'
fi

if [ "(( $+commands[eza] ))" ]; then
    unalias -m 'ls'
    alias ls='eza --color always --icons'
fi
