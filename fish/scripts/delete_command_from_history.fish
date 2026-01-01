#!/usr/bin/env fish

builtin history delete --exact --case-sensitive -- "$argv"

# Write a command to force parent shell to update history
if set -q FISH_HISTORY_UPDATE_FILE
    echo "builtin history merge" > $FISH_HISTORY_UPDATE_FILE
end