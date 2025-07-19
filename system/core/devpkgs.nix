{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zip
    unzip
    file
    binwalk
    git
    curl
    wget
    gcc
    clang
    rustup
    gnumake
    python3
    socat
    nmap
    inetutils
  ];

  programs.gnupg.agent.enable = true;
}
