## On remote hosts is preferred a single tmux session we reattach to
## Locally not as good
if status is-interactive
	and not set -q TMUX
	exec tmux new-session
end

if status is-interactive


	# Homebrew setup for macos. Not needed in Linux
	# Result of eval "$(/opt/homebrew/bin/brew shellenv)"
	#	set --global --export HOMEBREW_PREFIX "/opt/homebrew";
	#	set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar";
	#	set --global --export HOMEBREW_REPOSITORY "/opt/homebrew";
	#	fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
	#	if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end;
	#	if not contains "/opt/homebrew/share/info" $INFOPATH; set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH; end;
	### END result of eval "$(/opt/homebrew/bin/brew shellenv)"

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
	abbr --add tailscale "/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end

