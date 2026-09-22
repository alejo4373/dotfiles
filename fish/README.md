# Fish configuration

This directory is symlinked to `~/.config/fish`. Fish loads:

- `config.fish` for the general interactive configuration
- `conf.d/*.fish` during startup
- `functions/<name>.fish` on demand when `<name>` is first invoked
- `completions/<command>.fish` when completing that command

## Omarchy integration

`conf.d/omarchy.fish` is the Fish counterpart to Omarchy's packaged Bash
configuration under `/usr/share/omarchy/default/bash`. It configures the
Omarchy environment and defines the common Omarchy abbreviations. It returns
immediately when neither `/usr/share/omarchy` nor the `/etc/omarchy.conf`
development override exists, so these settings are not loaded on Debian.

Cross-distribution `mise` and `zoxide` initialization lives in
`conf.d/tools.fish`. Tide and `fzf.fish` are configured separately, so the
configuration deliberately does not initialize Starship or fzf's stock
bindings.

The ported shell helpers live in `functions/` rather than `omarchy.fish` so
Fish can autoload them. Omarchy command completion lives in
`completions/omarchy.fish`.

It is safe for the repository to symlink the entire Fish directory on a
non-Omarchy system: `conf.d/omarchy.fish` detects that Omarchy is absent before
referring to its paths, launchers, or commands. The individual function files
are mostly portable, but their dependencies still need to be installed.

## Function portability

| Functions | Runtime dependencies |
| --- | --- |
| `compress`, `decompress` | `tar` |
| `open` | `xdg-open` (usually from `xdg-utils`) |
| `n` | `nvim` |
| `zd` | `zoxide`, initialized with `zoxide init fish` |
| `ff`, `eff` | `fzf`, `bat`, and `file`; Kitty image previews additionally require Kitty |
| `sff` | The `ff` dependencies, GNU `find`, and `scp` |
| `fip` | OpenSSH client |
| `dip`, `lip` | `pkill` and `pgrep` (usually from `procps`) |
| `ga` | `git` and `mise` |
| `gd` | `git` and `gum` |

On some Debian releases, the Bat executable is named `batcat` instead of
`bat`. The current `ff` preview expects `bat`, so install/provide that command
or update `ff.fish` to select `batcat` when `bat` is unavailable.

The functions assume Fish syntax and should not be sourced by Bash. Commands
with missing optional dependencies fail only when invoked; Fish itself can
still start and autoload the other functions.
