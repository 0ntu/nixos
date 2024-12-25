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

    nodejs
    python3
    
    cargo
  ];

  programs.gnupg.agent.enable = true;
}
