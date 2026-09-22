## On remote hosts is preferred a single tmux session we reattach to
## Locally not as good
#  if status is-interactive
#    and not set -q TMUX
#    exec tmux new-session
#  end

if status is-interactive
	# Add my bins
	fish_add_path --global --path "$HOME/bin"

	# Add volta (for node, npm, yarn binaries)
	set --global --export VOLTA_HOME  "$HOME/.volta"
	fish_add_path --global --path "$VOLTA_HOME/bin"

	# Add docker bins
	fish_add_path --global --path "$HOME/.docker/cli-plugins"

	# Abreviations
	abbr --add fpc fzf-pick-command
	abbr --add ntc npm run type-check
	abbr --add ns npm start
	abbr --add nr npm run
	abbr --add pw playwright-cli
end

# OpenClaw completion
test -f "$HOME/.openclaw/completions/openclaw.fish"; and source "$HOME/.openclaw/completions/openclaw.fish"

# DevLens CLI
fish_add_path "$HOME/.devlens/bin"
