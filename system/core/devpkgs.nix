{pkgs, pkgs-2205, ...}: {
  environment.systemPackages = with pkgs; [
    pkgs-2205.quartus-prime-lite
    zip
    unzip

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
