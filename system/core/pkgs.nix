{outputs, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    outputs.packages."x86_64-linux".lazygit
    outputs.packages."x86_64-linux".lsd
    outputs.packages."x86_64-linux".starship
    outputs.packages."x86_64-linux".neovim
    outputs.packages."x86_64-linux".ghostty
    outputs.packages."x86_64-linux".zsh
    virt-viewer
    nvd
    nh
    rclone
    magic-wormhole
    firefox
    discord
    moonlight-qt
    headsetcontrol
    easyeffects
    tor-browser
    libreoffice
    obsidian
    vlc
    keepassxc
    zoom-us
    signal-desktop
    comma
    input-leap
    zip
    unzip
    file
    binwalk
    git
    curl
    wget
    gcc
    clang
    gnumake
    python3
    socat
    nmap
    inetutils
    bat
    duf
    dua
  ];

  programs.gnupg.agent.enable = true;
}
