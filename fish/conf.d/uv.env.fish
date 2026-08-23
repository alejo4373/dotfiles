
# Source uv's env.fish only if it exists (e.g. uv-installed binaries on PATH).
# On machines without uv, skip silently instead of erroring on startup.
if test -f "$HOME/.local/bin/env.fish"
    source "$HOME/.local/bin/env.fish"
end
