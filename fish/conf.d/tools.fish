# Cross-distribution command-line tool initialization.
# Tide and fzf.fish are configured separately, so this file does not initialize
# Starship or fzf's stock bindings.
if command -q mise
    mise activate fish | source
end

# Zoxide is a standalone package rather than a Fisher plugin.
if command -q zoxide
    zoxide init fish | source
end
