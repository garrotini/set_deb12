# minimal debian 12 setup

This setup came after having a few problems trying to compile some projects for 42 school (specially those graphical computing projects, such as, fractol/so_long/fdf/cub3d/minirt)

As I'm running Fedora daily, some libraries were a bit too "modern" in comparison to 42 Lisboa systems (they're operating on Ubuntu LTS version), and I wasn't able to have a smooth experience transitioning from my computer to school's computer.
(C standard compilers in a "fresh Fedora" install are newer (GCC 15) and do compile in a different way compared to Ubuntu 22.04 (GCC 11), and that was making all the compilations crash on my machine).

Also... 
I've been enjoying a tiling window manager at home with Wayland, but on this project I adapted my workflow to i3wm so I can fully work with X11 display manager.

As it's supposed to run on a VM (virt-manager), this setup is quite frugal (in terms of resources) and I hope it can handle basic computer programming for C and C++ projects.

## instructions (for future me)

0. Clean install of Debian 12 with just `ssh-server` and minimal drivers 
(this config might be ok: 30GBs of space, 8GBs of RAM, 3/4 cpus)

1. log as 'root', and run:

```bash
apt update && apt upgrade -y
apt install -y sudo git
MAIN_USER=$(getent passwd 1000 | cut -d: -f1)
usermod -aG sudo $MAIN_USER
```

2. log as <USER>, and clone this repo and cd into the directory:

```bash
git clone https://github.com/garrotini/set_deb12
```

3. run the scrips as indicated:
    - 1_pkgs.sh
    - 2_iosevka.sh
    - 3_dot_sh

## main ideas

- i3 wm
- vim, tmux
- terminal: alacritty
- gui file manager: thunar
- regular browser: firefox
- minimal browser: dillo (if javascript is not needed)
- backups and file-transfer: rsync
- (some keyboard tweaks, so that 'capslock' works as 'ctrl', just like a 400USD HHKB keyboard but free...)

## achievements

it spins up at around 200/230MB of RAM, which is quite amazing taking in consideration price of RAM at the time: February 2026!

### references and inspiration

- https://github.com/rwxrob
- https://www.tonybtw.com/
- https://github.com/hacktheclown
- https://app.daily.dev/sources/breadonpenguins
- https://larbs.xyz


### random screenshot (because why not...?)


