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

# Thefuck lazyload
function f () {
	unfunction f
    eval "$(thefuck --alias f)"
	f
}

# Sketchybar event
function brew () {
  command brew "$@"

  if [[ $* == "upgrade" ]]; then
    sketchybar --trigger brew_upgrade
  fi
}

# yazi
function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
