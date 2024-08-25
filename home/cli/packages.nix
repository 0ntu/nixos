{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    lazygit
    nvd
    nh
    bat
    zellij
  ];
}
