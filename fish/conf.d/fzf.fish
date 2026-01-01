set -gx FZF_DEFAULT_OPTS '--border
                          --layout=reverse
                          --ansi
                          --multi'

set -gx FZF_DEFAULT_COMMAND 'fd --hidden --follow --exclude ".{cache,gem,git,npm,DS_Store}" --exclude "{node_modules}"'


function __fzf_get_dir -d 'Find the longest existing filepath from input string'
    set dir $argv

    # Strip all trailing slashes. Ignore if $dir is root dir (/)
    if [ (string length -- $dir) -gt 1 ]
        set dir (string replace -r '/*$' -- '' $dir)
    end

    # Iteratively check if dir exists and strip tail end of path
    while [ ! -d "$dir" ]
        # If path is absolute, this can keep going until ends up at /
        # If path is relative, this can keep going until entire input is consumed, dirname returns "."
        set dir (dirname -- "$dir")
    end

    echo $dir
end

function __fzf_parse_commandline -d 'Parse the current command line token and return split of existing filepath, fzf query, and optional -option= prefix'
    set -l commandline (commandline -t)

    # strip -option= from token if present
    set -l prefix (string match -r -- '^-[^\s=]+=' $commandline)
    set commandline (string replace -- "$prefix" '' $commandline)

    # eval is used to do shell expansion on paths
    eval set commandline $commandline

    if [ -z $commandline ]
        # Default to current directory with no --query
        set dir '.'
        set fzf_query ''
    else
        set dir (__fzf_get_dir $commandline)

        if [ "$dir" = "." -a (string sub -l 1 -- $commandline) != '.' ]
            # if $dir is "." but commandline is not a relative path, this means no file path found
            set fzf_query $commandline
        else
            # Also remove trailing slash after dir, to "split" input properly
            set fzf_query (string replace -r "^$dir/?" -- '' "$commandline")
        end
    end

    echo $dir
    echo $fzf_query
    echo $prefix
end

function fzf-file-widget -d "List files and folders"
    set -l commandline (__fzf_parse_commandline)
    set -lx dir $commandline[1]
    set -l fzf_query $commandline[2]
    set -l prefix $commandline[3]

    set -lx OPTS '--bind=ctrl-p:toggle-preview,ctrl-d:preview-down,ctrl-u:preview-up\
                --scheme=path\
                --walker=file,dir,follow,hidden\
                --walker-root="$dir"\
                --preview="~/.config/fish/scripts/fzf-preview.sh {}"\
                --preview-window=hidden\
                --header="Ctrl-P: toggle preview
Ctrl-U/D: scroll preview"'

    eval fzf' -m --query "'$fzf_query'"' $OPTS | while read -l r
        set result $result $r
    end
    if [ -z "$result" ]
        commandline -f repaint
        return
    else
        # Remove last token from commandline.
        commandline -t ""
    end
    for i in $result
        commandline -it -- $prefix
        commandline -it -- (string escape $i)
        commandline -it -- ' '
    end
    commandline -f repaint
end

function fzf-history-widget -d "Show command history"
    # Create a unique temporary file
    set -lx FISH_HISTORY_UPDATE_FILE (mktemp)

    set -lx OPTS '--bind=ctrl-s:toggle-sort,"ctrl-y:execute-silent(~/.config/fish/scripts/copy_command.fish {})+abort","ctrl-h:execute-silent(~/.config/fish/scripts/delete_command_from_history.fish {})+abort"\
                --preview="echo {} | fish_indent --ansi"\
                --preview-window=up:3:wrap\
                --header="Ctrl-S: toggle sort
Ctrl-Y: copy command into clipboard
Ctrl-H: delete command from history"'

    history | eval fzf -q '(commandline)' $OPTS | read -l result
    and commandline -- $result

    # Update history if needed
    if test -f $FISH_HISTORY_UPDATE_FILE
        source $FISH_HISTORY_UPDATE_FILE
        rm -f $FISH_HISTORY_UPDATE_FILE
    end

    commandline -f repaint
end

bind -M insert \cf fzf-file-widget
bind -M insert \cr fzf-history-widget
