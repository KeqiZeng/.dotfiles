# set keybinds of some special plugins after initialization of zsh-vi-mode
function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  zload hlissner/zsh-autopair
  zload zdharma-continuum/fast-syntax-highlighting
}

# copy the content of a file to clipboard use bat
function yank ()
{
	bat -p $1 | pbcopy
	echo "The content of $1 has been copied to clipboard."
}

# mkdir & cd
function mkcd ()
{
	if [ -d $1 ]
	then
		echo "Directory '$1' exists"
		return 1
	else
		mkdir $1
		cd $1
	fi
}

# calculate
function cc() { python3 -c "from math import *; print($*);" }

# find-in-file - usage: fif <searchTerm>
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages --hidden "$1" | fzf --preview "bat --color=always | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
