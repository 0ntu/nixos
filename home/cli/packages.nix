{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    lazygit
    unzip
    nvd
    nh
    bat
  ];
}
