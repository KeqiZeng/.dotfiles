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

# rename
function rename() {
	mv $1 $(dirname $1)/$2
}

# calculate
function cc() { python3 -c "from math import *; print($*);" }

# find-in-file - usage: fif <searchTerm>
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages --hidden "$1" | fzf --preview "bat --color=always | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Zoxide lazyload
function j () {
	unfunction j
	eval "$(zoxide init zsh --cmd j)"
	j $@
}

# Thefuck lazyload
function f () {
	unfunction f
    eval "$(thefuck --alias f)"
	f
}

# Conda lazyload
function conda() {
	unfunction conda
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
			. "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
		else
			export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
	conda $@
}

function conda-env() {
	unfunction conda-env
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
		eval "$__conda_setup"
	else
		if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
			. "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
		else
			export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
		fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
	conda-env $@
}
