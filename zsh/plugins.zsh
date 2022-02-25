# auto download uz to manage plugins
[[ -f ~/.dotfiles/zsh/uz/uz.zsh ]] || git clone https://github.com/KeqiZeng/uz ~/.dotfiles/zsh/uz
source ~/.dotfiles/zsh/uz/uz.zsh

plugins=('Aloxaf/fzf-tab'
	     'zsh-users/zsh-completions'
	     'zsh-users/zsh-autosuggestions'
	     'zdharma-continuum/fast-syntax-highlighting'
	     'jeffreytse/zsh-vi-mode'
   )

for plugin in ${plugins[@]}; do
	zadd $plugin
done
