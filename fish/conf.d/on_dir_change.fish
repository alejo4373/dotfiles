function __check_dir_variable --on-variable PWD
    # Define the target directory and the environment variable
    set -l target_dir "$HOME/code/IndiVend-App"

    if test "$PWD" = "$target_dir"; or string match -q -- "$target_dir/*" "$PWD"
        # Export the environment variable when inside the repo
        set -gx CLAUDE_CONFIG_DIR "$HOME/.claude-iv"
    else
        # Optional: Unset the variable when leaving the directory
        set -e CLAUDE_CONFIG_DIR
    end
end

__check_dir_variable
