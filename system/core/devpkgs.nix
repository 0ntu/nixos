{outputs, pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    outputs.packages."x86_64-linux".shell
    outputs.packages."x86_64-linux".neovim
    outputs.packages."x86_64-linux".ghostty
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
