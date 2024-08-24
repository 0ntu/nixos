{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
