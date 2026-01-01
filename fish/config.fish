if status is-interactive
    # environment variables
    set -gx XDG_CONFIG_HOME $HOME/.config
    set -gx BAT_CONFIG_PATH $HOME/.dotfiles/bat/bat.conf
    set -gx TEALDEER_CONFIG_DIR $XDG_CONFIG_HOME/tealdeer
    set -gx GOPATH $HOME/go
    set -gx RUSTUP_HOME $HOME/rust/.rustup
    set -gx CARGO_HOME $HOME/rust/.cargo
    set -gx CC (brew --prefix llvm)/bin/clang
    set -gx CXX (brew --prefix llvm)/bin/clang++

    set -gx EDITOR nvim

    set fish_greeting ''

    # flag
    add_flag LDFLAGS -L/opt/homebrew/opt/llvm/lib
    add_flag LDFLAGS -L/opt/homebrew/opt/curl/lib
    add_flag CPPFLAGS -I/opt/homebrew/opt/llvm/include
    add_flag CPPFLAGS -I/opt/homebrew/opt/curl/include

    # path
    fish_add_path -g /opt/homebrew/bin
    fish_add_path -g /opt/homebrew/sbin
    fish_add_path -g $HOME/micromamba/bin
    fish_add_path -g $GOPATH/bin
    fish_add_path -g $CARGO_HOME/bin
    fish_add_path -g /opt/homebrew/opt/llvm/bin
    fish_add_path -g /opt/homebrew/opt/curl/bin
    fish_add_path -g /Users/ketch/.local/share/nvim/mason/bin
    fish_add_path -g $HOME/scripts

    # vim mode
    set -g fish_key_bindings fish_vi_key_bindings
    set fish_cursor_default block
    set fish_cursor_insert line
    set fish_cursor_replace_one underscore
    set fish_cursor_replace underscore
    set fish_cursor_external line
    set fish_cursor_visual block

    # alias
    alias c="clear"
    alias n="fastfetch"
    alias ra="yy"
    alias td="tldr"
    alias tk='tokei'
    alias lg="lazygit"
    alias nv="nvim"
    alias bi='brew install'
    alias bic='brew install --cask'
    alias bu='brew upgrade'
    alias bs='brew search'
    alias bd='brew uninstall'
    alias br='brew rmtree'
    alias bc='brew cleanup'
    alias bl='brew list'
    alias mba='mamba activate'
    alias mbd='mamba deactivate'
    alias mmb='micromamba'
    alias mmba='micromamba activate'
    alias mmbd='micromamba deactivate'
    alias preview='sh ~/scripts/preview.sh'
    alias true-color='sh ~/scripts/true-color.sh'
    alias mujoco='/Applications/MuJoCo.app/Contents/MacOS/simulate'
    alias mujoco_basic='/Applications/MuJoCo.app/Contents/MacOS/basic'
    alias mujoco_compile='/Applications/MuJoCo.app/Contents/MacOS/compile'
    alias surf='/Applications/Windsurf.app/Contents/MacOS/Electron'

    if type -q bat
        functions -e cat
        alias cat='bat'
    end

    if type -q eza
        functions -e ls
        alias ls='eza --color=always --icons'
    end

    if test "$TERM" = xterm-kitty
        alias icat='kitty +kitten icat'
        alias ssh='kitty +kitten ssh'
        alias diff='kitty +kitten diff'
    end

    # starship
    starship init fish | source

    # zoxide
    zoxide init fish --cmd j | source

    # thefuck
    thefuck --alias f | source
end

# Set theme
source $XDG_CONFIG_HOME/fish/themes/$THEME.fish

# Added by Antigravity
fish_add_path /Users/ketch/.antigravity/antigravity/bin

string match -q "$TERM_PROGRAM" "kiro" and . (kiro --locate-shell-integration-path fish)
