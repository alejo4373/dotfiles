function eff --description 'Select a file with fzf and edit it'
    set -l file (ff)
    test -n "$file"; and eval "$EDITOR "(string escape -- "$file")
end
