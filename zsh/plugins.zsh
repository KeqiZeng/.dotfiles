# auto download uz to manage plugins
[[ -f ~/.dotfiles/zsh/uz/uz.zsh ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz

declare -A plugins
plugins=(
	     ['zsh-users/zsh-completions']=1
		 ['esc/conda-zsh-completion']=1
		 ['Aloxaf/fzf-tab']=0
	     ['zsh-users/zsh-autosuggestions']=0
		 ['hlissner/zsh-autopair']=0
	     ['zdharma-continuum/fast-syntax-highlighting']=0
		 ['jeffreytse/zsh-vi-mode']=0
	)

source ~/.dotfiles/zsh/uz/uz.zsh
