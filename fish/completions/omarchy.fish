# Complete the public Omarchy command hierarchy from installed executables.
function __omarchy_complete
    set -l prefix omarchy
    for part in (commandline -opc)[2..]
        string match -q -- '-*' "$part"; and continue
        set prefix "$prefix-$part"
    end

    set -l omarchy_bin (command -s omarchy)
    test -n "$omarchy_bin"; or return
    set -l bin_dir (path dirname (path resolve "$omarchy_bin"))
    for candidate in $bin_dir/$prefix-*
        test -x "$candidate"; or continue
        string replace -r "^.*/$prefix-" '' "$candidate" | string split -f 1 -m 1 -- '-'
    end
end
complete --command omarchy --no-files --arguments '(__omarchy_complete)'
