{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
