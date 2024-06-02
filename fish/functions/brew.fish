function brew
    command brew $argv

    if test "$argv[1]" = "upgrade"
        sketchybar --trigger brew_upgrade
    end
end
