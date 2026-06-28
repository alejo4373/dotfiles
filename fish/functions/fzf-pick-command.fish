function fzf-pick-command --description 'Fuzzy-pick an executable from PATH and put it on the command line'
    status is-interactive; or return 1

    set -l picked (
        for dir in (string split : -- $PATH)
            test -d "$dir"; or continue
            find "$dir" -maxdepth 1 \( -type f -o -type l \) 2>/dev/null \
                | while read -l file
                    test -x "$file"; and path basename "$file"
                end
        end | sort -u | _fzf_wrapper
    )

    if test -z "$picked"
        return 1
    end

    commandline -r -- "$picked "
    commandline -f repaint
end
