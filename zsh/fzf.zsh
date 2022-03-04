export FZF_DEFAULT_OPTS='--bind ctrl-d:preview-down,ctrl-u:preview-up,ctrl-p:toggle-preview
                         --border
						 --layout=reverse
						 --preview "if [[ -n {} ]]; then if [ -d {} ]; then echo {}/ && exa -1 --color always --icons {} | head -500; else if [[ $(file --mime {}) =~ binary ]]; then echo {} is a binary file; else bat --style=numbers --color=always --line-range :500 {}; fi; fi; fi"
						 --preview-window hidden
						 --color=bg+:#3f3f3f,bg:#252525,border:#6b6b6b,spinner:#98c378,hl:#98c378,fg:#d9d9d9,header:#98c378,info:#e5c07b,pointer:#ff9999,marker:#e5c07b,fg+:#d9d9d9,preview-bg:#1e1e1e,prompt:#bb88e5,hl+:#98c378
						 '

export FZF_CTRL_R_OPTS='--preview "echo {}"'
export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_COMMAND='fd --hidden --follow -E .git -E .DS_Store'

_fzf_compgen_path() {
  fd --hidden --follow -E ".git" -E .DS_Store . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow -E ".git" . "$1"
}

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# fzf-tab
# kill 结束进程时时提供预览
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'

zstyle ':fzf-tab:complete:*' fzf-preview 'if [[ -n $realpath ]]; then if [ -d $realpath ]; then echo $realpath/ && exa -1 --color always --icons $realpath | head -500; else if [[ $(file --mime $realpath) =~ binary ]]; then echo $realpath is a binary file; else bat --style=numbers --color=always --line-range :500 $realpath; fi; fi; fi'
setopt globdots
