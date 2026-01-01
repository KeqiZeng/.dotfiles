export ZIPPO_PATH=$HOME/.uz
[[ -d $ZIPPO_PATH ]] || git clone https://github.com/KeqiZeng/uz $ZIPPO_PATH

typeset -A plugins

plugins=(
  zsh-users/zsh-completions "[completion]=true"
  esc/conda-zsh-completion "[completion]=true"
  Aloxaf/fzf-tab ""
  hlissner/zsh-autopair ""
  zsh-users/zsh-autosuggestions "[commit]=f9526195c50ddf2cec64e0ce6310bc5a68d4c340"
  zsh-users/zsh-syntax-highlighting "[script]=zsh-syntax-highlighting.zsh"
)

source ${ZIPPO_PATH}/zippo.zsh
