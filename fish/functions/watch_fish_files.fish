#!/usr/bin/env fish

function watch_fish_files --on-event fish_prompt
  set -l fish_dir ~/.config/fish
  set -l checksum_file ~/.config/fish/.checksums

  set -l current_checksums (command mktemp)

  command find $fish_dir -type f -name '*.fish' -exec md5 -r {} + > $current_checksums

  if not test -f $checksum_file
      command cp $current_checksums $checksum_file
      return
  end

  set -l changes (command diff $checksum_file $current_checksums)

  if test -n "$changes"
    for line in (echo $changes | string split '\n')
        set match (echo $line | string match -r '.* /.*\.fish$')
        if test -n "$match"
            set file (echo $match | string split ' ' | tail -n 1)
            source $file
            echo "source $file"
        end
    end

    cp $current_checksums $checksum_file
  end

  command rm $current_checksums
end
