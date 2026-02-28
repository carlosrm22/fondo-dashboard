# Fondo Dashboard (replaces old hollywood distrobox wrapper)

This repository now ships a native `tmux` dashboard called `fondo`.

## Why this replacement

- No `distrobox` required
- Faster startup
- Works directly in Fedora terminal environments
- Includes motion effects (layout rotation + pane shuffling)
- Includes a `Hollywood Feed` pane inspired by original Ubuntu Hollywood widgets

## Included files

- `fondo`: main launcher (6 panes, neon theme, motion)
- `fondo-hud`: clock + uptime + network HUD widget
- `fondo-cinema`: rotating feed (`hexdump`, `man`, `tree`, `stat`)
- `fondo-animate`: background layout/pane animator
- `hollywood.sh`: compatibility shell functions/aliases (`hollywood` -> `fondo`)
- `install.sh`: installs commands to `~/.local/bin`

## Install

```bash
./install.sh
hash -r
fondo
```

## Runtime options

```bash
FONDO_LAYOUT_INTERVAL=5 fondo   # faster motion
FONDO_MOTION=0 fondo            # static layout
```

## Useful keys inside tmux

- `Ctrl+b q`: kill `fondo` session
- `Ctrl+b l`: next layout
- `Ctrl+b r`: rotate panes

## About original Ubuntu Hollywood

The original package by Dustin Kirkland is available at:

- https://github.com/dustinkirkland/hollywood
- https://launchpad.net/ubuntu/+source/hollywood

Its widget scripts are in `/usr/lib/hollywood` and include:
`apg`, `atop`, `bmon`, `cmatrix`, `hexdump`, `htop`, `jp2a`, `man|ccze`, `speedometer`, `ssh-keygen`, `stat`, `tree`, `mplayer -vo caca`.
