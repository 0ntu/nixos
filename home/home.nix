{
  inputs,
  machine,
  ...
}: {
  home.username = "ontu";
  home.homeDirectory = "/home/ontu";
  home.stateVersion = "23.11";
  home.sessionVariables = {};
  imports = [
    ./cli
    ./packages.nix
    ../hosts/${machine}/packages.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.home-manager.enable = true;
}
