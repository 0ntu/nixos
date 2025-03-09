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
    gnumake
    python3
    socat
    nmap
  ];

  programs.gnupg.agent.enable = true;
}
