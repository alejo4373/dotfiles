set -gx OMARCHY_PATH /usr/share/omarchy
set -gx EDITOR "omarchy-launch-editor --inline"
set -gx SUDO_EDITOR $EDITOR
set -gx BROWSER omarchy-launch-browser
set -gx BAT_THEME ansi
set -gx MANROFFOPT -c
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
