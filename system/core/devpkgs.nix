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
    gnupg

    nodejs
    python3
    
    cargo
  ];
}
