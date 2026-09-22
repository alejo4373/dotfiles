function zd --description 'Change directory directly or jump using zoxide'
    if test (count $argv) -eq 0
        builtin cd ~
    else if test -d "$argv[1]"
        builtin cd "$argv[1]"
    else if command -q zoxide
        z $argv; or begin
            echo 'Error: Directory not found'
            return 1
        end
        printf '\U000F17A9 %s\n' "$PWD"
    else
        echo 'zoxide is not installed'
        return 1
    end
end
