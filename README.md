```
      __  _           __    _               
     / / | |         / /   (_)              
    / /__| |_ ___   / / __  ___  _____  ___ 
   / / _ \ __/ __| / / '_ \| \ \/ / _ \/ __|
  / /  __/ || (__ / /| | | | |>  < (_) \__ \
 /_/ \___|\__\___/_/ |_| |_|_/_/\_\___/|___/
                                            
                                Dotfile Repo
```
<h1>
<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="600px" /> <br>
   <a href="https://github.com/0ntu/nixos/">
      <img src="https://img.shields.io/github/repo-size/0ntu/nixos?color=ea999c&labelColor=303446&style=for-the-badge">
   </a>
   <a href="https://nixos.org">
      <img src="https://img.shields.io/badge/NixOS-unstable-blue.svg?style=for-the-badge&labelColor=303446&logo=NixOS&logoColor=white&color=91D7E3">
   </a>
   <a href="https://github.com/0ntu/nixos/commits/master/">
      <img src="https://img.shields.io/github/last-commit/0ntu/nixos?color=ca9ee6&labelColor=303446&style=for-the-badge">
   </a>
</h1>
My Personal Nix-ified Dotfile repository

About
-----
This repository contains my NixOS system configurations, as well as packages wrapped with my dotfiles.
Currently, my setup consists of two hosts: my desktop and laptop (x86-64 systems). This environment
is my daily-driver for both, with declarative and reproducible configs for reliable software management.

Packages exported via the Flake are customized to my preferences (keybinds, colorschemes, layout, and all), and can be installed
to any machine running the [Nix Package Manager](https://nixos.org/download/).

Layout
------
```
.
├── home         # Home-Manager config
├── hosts        # Host-specific configuration
├── system       # Core system utilities
├── flake.nix    # NixOS System Declarations & Package Exports
```
Screenshots
------
![image](https://github.com/user-attachments/assets/a87398c5-a664-4815-a922-16d1affc0e3e)
![image](https://github.com/user-attachments/assets/d3e11755-4877-4517-8cde-cfdb1658432c)

Installation
------

### OS
```
$ git clone https://github.com/0ntu/nixos.git
$ cd nixos
$ nixos-rebuild switch --flake .#<HOST>
```

### Packages
Ensure you have [Flakes](https://wiki.nixos.org/wiki/Flakes) enabled
```nix
~/.config/nix/nix.conf

experimental-features = nix-command flakes
```

You can always test-drive these packages with `nix run`

#### Neovim
```
$ nix profile install github:0ntu/nixos#neovim
```
