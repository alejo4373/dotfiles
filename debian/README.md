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


