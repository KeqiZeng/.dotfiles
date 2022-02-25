# auto download uz to manage plugins
[[ -f ~/.dotfiles/zsh/uz/uz.zsh ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz
source ~/.dotfiles/zsh/uz/uz.zsh

zadd Aloxaf/fzf-tab
zadd zsh-users/zsh-completions
zadd zsh-users/zsh-autosuggestions
zadd zdharma-continuum/fast-syntax-highlighting
zadd jeffreytse/zsh-vi-mode
