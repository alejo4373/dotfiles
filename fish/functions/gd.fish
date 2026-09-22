function gd --description 'Remove the current Git worktree and branch'
    command -q gum; or begin
        echo 'gd requires gum'
        return 1
    end
    gum confirm 'Remove worktree and branch?'; or return

    set -l cwd $PWD
    set -l worktree (basename "$cwd")
    set -l parts (string split -m 1 -- '--' "$worktree")
    test (count $parts) -eq 2; or begin
        echo 'Refusing: current directory does not look like a managed worktree'
        return 1
    end

    cd "../$parts[1]"; or return
    command git worktree remove "$cwd" --force; or return
    command git branch -D "$parts[2]"
end
