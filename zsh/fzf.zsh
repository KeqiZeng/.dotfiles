# export FZF_DEFAULT_OPTS='--bind ctrl-d:preview-down,ctrl-u:preview-up,ctrl-p:toggle-preview
#                          --border
# 						             --layout=reverse
# 						             --preview "if [[ -n {} ]]; then if [ -d {} ]; then echo {}/ && exa -1 --color always --icons {} | head -500; else if [[ $(file --mime {}) =~ binary ]]; then echo {} is a binary file; else bat --style=numbers --color=always --line-range :500 {}; fi; fi; fi"
# 						             --preview-window hidden
# 						             --color=bg+:#313244,bg:#1e1e2e,border:#6b6b6b,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,preview-bg:#1e1e2e,prompt:#cba6f7,hl+:#f38ba8
# 						 '
export FZF_DEFAULT_OPTS='--bind ctrl-d:preview-down,ctrl-u:preview-up,ctrl-p:toggle-preview
                         --border
						             --layout=reverse
						             --preview "~/scripts/fzf-preview.sh {}"
						             --preview-window hidden
						             --color=bg+:#313244,bg:#1e1e2e,border:#6b6b6b,spinner:#f5e0dc,hl:#f38ba8,fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc,marker:#f5e0dc,fg+:#cdd6f4,preview-bg:#1e1e2e,prompt:#cba6f7,hl+:#f38ba8
						 '

export FZF_COMPLETION_TRIGGER='\'
export FZF_DEFAULT_COMMAND='fd --hidden --follow --exclude ".{cache,gem,git,npm,DS_Store}" --exclude "{node_modules}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".{gem,git,npm,DS_Store}" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".{gem,git,npm}" . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# fzf-tab
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm,cmd -w -w"
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-preview 'ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:kill:argument-rest' fzf-flags '--preview-window=down:3:wrap'

zstyle ':fzf-tab:complete:*' fzf-preview 'if [[ -n $realpath ]]; then if [ -d $realpath ]; then echo $realpath/ && exa -1 --color always --icons $realpath | head -500; else if [[ $(file --mime $realpath) =~ binary ]]; then echo $realpath is a binary file; else bat --style=numbers --color=always --line-range :500 $realpath; fi; fi; fi'
setopt globdots
