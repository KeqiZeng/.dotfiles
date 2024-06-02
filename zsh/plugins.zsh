# auto download uz to manage plugins
[[ -f ~/.dotfiles/zsh/uz/uz.zsh ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz

declare -A plugins
# 0 for default
# 1 for completions
# 2 for frozen
# 3 for frozen completions
plugins=(
	     ['zsh-users/zsh-completions']=1
	  	 ['esc/conda-zsh-completion']=1
  		 ['Aloxaf/fzf-tab']=0
       ['thirteen37/fzf-brew']=2
	     ['zsh-users/zsh-autosuggestions']=0
       ['hlissner/zsh-autopair']=0
	     ['zdharma-continuum/fast-syntax-highlighting']=0
	)

source ~/.dotfiles/zsh/uz/uz.zsh
