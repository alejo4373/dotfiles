function open --description 'Open paths or URLs without tying them to the terminal'
    command xdg-open $argv >/dev/null 2>&1 &
    disown
end
