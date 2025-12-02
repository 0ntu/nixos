{outputs, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    outputs.packages."x86_64-linux".shell
    outputs.packages."x86_64-linux".neovim
    outputs.packages."x86_64-linux".ghostty

    virt-viewer

    nvd
    nh
    rclone
    magic-wormhole
    firefox
    discord
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
  ];

  programs.gnupg.agent.enable = true;
}
