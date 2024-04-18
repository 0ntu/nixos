{...}: {
  home.username = "ontu";
  home.homeDirectory = "/home/ontu";
  home.stateVersion = "23.11";
  home.sessionVariables = {};
  imports = [
    ./cli
    ./packages.nix
  ];
  programs.home-manager.enable = true;
}
