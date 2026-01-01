function random_theme
    set theme_dir "$HOME/.config/kitty/themes"
    set themes (find $theme_dir -type f -name "*.conf" | string match -r '.*\.conf$')

    if test (count $themes) -gt 0
        set random_theme (random 1 (count $themes))
        set theme (basename $themes[$random_theme] .conf)

        set -gx THEME $theme
        set -gx BAT_THEME $theme
        set -gx YAZI_THEME (string lower $theme)
        kitten @ set-colors --all --configured $theme_dir/$theme.conf
        source $XDG_CONFIG_HOME/fish/themes/$THEME.fish
    end
    echo "Set theme to $theme"
end

