# auto download uz to manage plugins
[[ -f ~/.dotfiles/zsh/uz/uz.zsh ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz

plugins=(
	     'zsh-users/zsh-completions'
		 'Aloxaf/fzf-tab'
	     'zsh-users/zsh-autosuggestions'
		 'hlissner/zsh-autopair'
	     'zdharma-continuum/fast-syntax-highlighting'
		 'jeffreytse/zsh-vi-mode'
	)

source ~/.dotfiles/zsh/uz/uz.zsh
