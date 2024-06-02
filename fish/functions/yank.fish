function yank -d "Copy the content of the file to clipboard."
    command cat $argv | pbcopy
    echo "The content of $argv has been copied to clipboard."
end
