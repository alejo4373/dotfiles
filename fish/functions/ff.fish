function ff --description 'Pick a file with an fzf preview'
    if test "$TERM" = xterm-kitty
        command fzf --preview 'case $(file --mime-type -b {}) in image/*) kitty icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0 {} ;; *) bat --style=numbers --color=always {} ;; esac'
    else
        command fzf --preview 'bat --style=numbers --color=always {}'
    end
end
