# auto download uz to manage plugins
[[ -d ~/.dotfiles/zsh/uz ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz

declare -A plugins

plugins=(
  ['zsh-users/zsh-completions']="( [completion]=0 [frozen]=1 )" # 0: true 1: false
  ['esc/conda-zsh-completion']="( [completion]=0 [frozen]=1 )"
  ['Aloxaf/fzf-tab']="( [completion]=1 [frozen]=1 )"
  ['zsh-users/zsh-autosuggestions']="( [completion]=1 [frozen]=1 )"
  ['hlissner/zsh-autopair']="( [completion]=1 [frozen]=1 )"
  ['zdharma-continuum/fast-syntax-highlighting']="( [completion]=1 [frozen]=1 )"
)

source ~/.dotfiles/zsh/uz/uz.zsh
