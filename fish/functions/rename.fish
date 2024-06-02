function rename -d "rename a file or directory"
    command mv $argv[1] (dirname $argv[1])/$argv[2]
end
