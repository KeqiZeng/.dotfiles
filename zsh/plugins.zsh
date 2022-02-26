# auto download uz to manage plugins
[[ -f ~/.dotfiles/zsh/uz/uz.zsh ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz

plugins=('Aloxaf/fzf-tab'
	     'zsh-users/zsh-completions'
	     'zsh-users/zsh-autosuggestions'
	     'zdharma-continuum/fast-syntax-highlighting'
	     'jeffreytse/zsh-vi-mode'
   )

source ~/.dotfiles/zsh/uz/uz.zsh
