function add_flag
    set -l flag_name $argv[1]
    set -l new_value $argv[2]

    if not contains -- $new_value $$flag_name
        set -gx $flag_name $$flag_name $new_value
    end
end
