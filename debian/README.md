# My Debian Setup

This Debian setup was last used in my Thinkpad L440 in Jun 2021

## Debian

Installed debian from the `debian-10.9.0-amd64-netinst.iso` image 

## Wifi

The Thinkpad L440 need `firmware-iwlwifi` package installed to work. Then the network connection is managed by `wicd`

To list the network interfaces use:

```sh
ip link show
```

## Synaptics Touchpad

There are two drivers for the synaptics trackpad `libinput` and `xserver-xorg-input-synaptics` which allows to enable trackpad features like tap-to-click. I am using To `libinput` driver. To configure it, the file in `etc/X11/xorg.conf.d/synaptics-libinput.conf` in this repo is used.

## Other

1. Install git, curl, htop, zsh, vim, mpv
2. Install youtube-dl from https://ytdl-org.github.io/youtube-dl/download.html
3. Install nvm from GitHub and then install `npm install --lts`
4. Install VScode from official site.

### zsh
1. Install oh-my-zsh and symlink zsh/.zshrc from this repo to ~/.zshrc
2. Install zsh-completions from https://github.com/zsh-users/zsh-completions

### VSCode

Extensions:
* Code Spell Checker
* pgsql
* Dracula Official Theme
* Rainbow Brakets
* Vim (vscodevim)
* Live Server

### Postgres

* Use Postgres 12 or 13 because ealier versions don't support generated columns, which I'm using in a few of my apps.
* This usually requires postgres to be installed from the official site and not from the distributions repositories.
* Make sure postgres is running in port `5432` by checking `/etc/postgresql/13/main/postgres.conf`
* Log into the database with user `postgres` via `sudo -u postgres psql`
* Create a database user/role for the current Debian user with `CREATE USER alejandro WITH CREATEDB PASSWORD NULL`
* `\du` lists all roles
* Create default database for current Debian user with the same name of the user via `createdb alejandro`
* Edit `/etc/postgresql/13/main/pg_hba.conf` to trust local tcp connections
```
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
```

## Shortcuts that I miss from Mac

* `ALT/CMD + SHIFT + [ | ]` to switch tabs in the browser or the iterm. Partically mitigated via Vimium extension key mapping. It doesn't work if there's a tab where the extension cannot run, like chrome://extensions or even the chrome.google.com (extensions store)
* `ALT/CMD + [|]` to go back or forward in the browser. NOT MITIGATED 
* `ALT/CMD + SPACE` to launch applications via Spotlight (mac). MITIGATED via i3 keybindings running d-menu
* `CMD + OPTION + F` to make a window full screen via the Spectacle App. MITIGATED via i3 keybindings 
* `CMD + OPTION + LEFT|RIGHT|UP|DOWN` to make a window half the screen Spectacle App. NOT MITIGATED 
* `ALT/CMD + T` to create tabs in most applications (browser, iterm, vscode, finder). NOT MITIGATED

## Tracking down why dmenu doesn't have the correct PATH

Problem: dmenu does not have $PATH properly set and therefore it doesn't find many of my programs.

Findings:

* dmenu_run parent process is PID=1 or `init`
* dmenu_run runs with $SHELL=zsh and $USER=alejandro
* dmenu_run "incomplete" $PATH at is `/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games`
* When launching dmenu_run via the mod1+space i3 shortut my ~/.zshrc is not read file
* When running dmenu_run from a terminal and with no cache (.cache/dmenu_run), dmenu will run with my "complete" $PATH
* /etc/zsh/zshenv is run before dmenu_run is spawned. Verified because new variables exported were present when running printenv > ~/env.out in dmenu
* The variables exported in /etc/zsh/zshenv don't make it into dmenu's environment because dmenu is not a child of the shell(zsh) process.
* dmenu is launched by i3 

Trying to figure out how the WM(i3) is launched

* https://wiki.archlinux.org/title/LightDM
* `systemctl status lightdm` shows that lightdm was started by running /etc/X11/default-display-manager
* lightdm starts the X server and i3 as seen in /var/log/lightdm.log
* /etc/X11/xinitrc -> Xsession -> ~/.xsessionrc

### Conclusion
Because of the way that I log into my computer (via a displaymanager LightDM) graphical applications like dmenu that need my PATH don't get my full path being configured in ~/.zshrc because they are not children of the shell (zsh), they are children of the X server, therefore any ENV variables GUI programs need must be set in the files sourced by the X server starup process like /etc/X11/xsession, etc in my case ~/.xsessionrc

The solution then was to add the additional PATH setup I needed to ~/.xsessionrc

References:
* https://unix.stackexchange.com/questions/335515/i3-dmenu-does-not-browse-path
* https://www.debian.org/doc/manuals/debian-reference/ch07.en.html#_starting_the_x_window_system
* https://wiki.archlinux.org/title/LightDM#Environment_variables

