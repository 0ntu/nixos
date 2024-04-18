{pkgs, ...}: {
  home.packages = with pkgs; [
    lazygit
    unzip
  ];
}
