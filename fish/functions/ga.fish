function ga --description 'Create and enter a Git worktree for a new branch'
    test (count $argv) -gt 0; or begin
        echo 'Usage: ga <branch name>'
        return 1
    end
    set -l branch $argv[1]
    set -l worktree "../"(basename "$PWD")"--$branch"
    command git worktree add -b "$branch" "$worktree"; or return
    command mise trust "$worktree"; or return
    cd "$worktree"
end
