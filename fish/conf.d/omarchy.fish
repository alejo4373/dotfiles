# Fish counterpart to /usr/share/omarchy/default/bash/rc.
# Keep this file user-owned: files below /usr/share/omarchy are replaced by updates.

# This repository is also used on Debian. Do not export Omarchy paths, select
# Omarchy launchers, or install its abbreviations when Omarchy is absent.
if not test -d /usr/share/omarchy; and not test -r /etc/omarchy.conf
    return
end

# Environment
set -gx OMARCHY_PATH /usr/share/omarchy
if test -r /etc/omarchy.conf
    # omarchy-dev-link may override OMARCHY_PATH here. The file is POSIX shell,
    # so extract just this setting rather than sourcing it as Fish code.
    set -l configured_path (string match -r '^OMARCHY_PATH=.*' < /etc/omarchy.conf | string replace -r '^OMARCHY_PATH=' '' | string trim -c "\"'")
    test -n "$configured_path"; and set -gx OMARCHY_PATH $configured_path
end

if test "$OMARCHY_PATH" != /usr/share/omarchy
    fish_add_path --global --move "$OMARCHY_PATH/bin"
end
fish_add_path --global --append "$HOME/.local/share/mise/shims" "$HOME/.local/bin"

set -q EDITOR; or set -gx EDITOR "omarchy-launch-editor --inline"
set -gx SUDO_EDITOR $EDITOR
set -q BROWSER; or set -gx BROWSER omarchy-launch-browser
set -gx BAT_THEME ansi
set -gx MANROFFOPT -c
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Omarchy's everyday abbreviations. Fish expands these visibly before running.
if status is-interactive
    command -q eza; and begin
        abbr --add ls 'eza -lh --group-directories-first --icons=auto'
        abbr --add lsa 'eza -lha --group-directories-first --icons=auto'
        abbr --add lt 'eza --tree --level=2 --long --icons --git'
        abbr --add lta 'eza --tree --level=2 --long --icons --git -a'
    end

    abbr --add .. 'cd ..'
    abbr --add ... 'cd ../..'
    abbr --add .... 'cd ../../..'
    command -q zoxide; and abbr --add cd zd
    abbr --add a 'omarchy-agent --inline'
    abbr --add c 'opencode --auto'
    abbr --add cx 'printf "\e[2J\e[3J\e[H" && claude --permission-mode bypassPermissions'
    abbr --add cy 'codex -s danger-full-access -a never'
    abbr --add d docker
    abbr --add r rails
    abbr --add t 'tmux attach || tmux new -s Work'
    abbr --add h herdr
    abbr --add ic 'tdl c'
    abbr --add ix 'tdl cx'
    abbr --add icx 'tdl c cx'
    abbr --add mup 'env MISE_MINIMUM_RELEASE_AGE=0 mise up'
    abbr --add g git
    abbr --add gcm 'git commit -m'
    abbr --add gcam 'git commit -a -m'
    abbr --add gcad 'git commit -a --amend'
end

# On this machine default heap size is 2GB and running type-check on IndiVend-App fails
# due to OOM
set -xg NODE_OPTIONS "--max-old-space-size=8196"
