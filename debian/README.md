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
2. Install oh-my-zsh and symlink zsh/.zshrc from this repo to ~/.zshrc
3. Install youtube-dl from https://ytdl-org.github.io/youtube-dl/download.html

## Shortcuts that I miss from Mac

* `ALT/CMD + SHIFT + [ | ]` to switch tabs in the browser or the iterm. Partically mitigated via Vimium extension key mapping. It doesn't work if there's a tab where the extension cannot run, like chrome://extensions or even the chrome.google.com (extensions store) 
* `ALT/CMD + [|]` to go back or forward in the browser. NOT MITIGATED 
* `ALT/CMD + SPACE` to launch applications via Spotlight (mac). MITIGATED via i3 keybindings running d-menu
* `CMD + OPTION + F` to make a window full screen via the Spectacle App. MITIGATED via i3 keybindings 
* `CMD + OPTION + LEFT|RIGHT|UP|DOWN` to make a window half the screen Spectacle App. NOT MITIGATED 
* `ALT/CMD + T` to create tabs in most applications (browser, iterm, vscode, finder). NOT MITIGATED

