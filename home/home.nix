{
  machine,
  ...
}: {
  home.username = "ontu";
  home.homeDirectory = "/home/ontu";
  home.stateVersion = "23.11";
  home.sessionVariables = {};
  imports = [
    ./cli
    ./cli/neovim/flake.nix
    ./packages.nix
    ../hosts/${machine}/packages.nix
  ];
  programs.home-manager.enable = true;
}
