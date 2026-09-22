if test (uname) = Darwin
    if test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv fish | source
    end

    abbr --add tailscale "/Applications/Tailscale.app/Contents/MacOS/Tailscale"
end
