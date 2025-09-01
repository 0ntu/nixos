{
  config,
  lib,
  pkgs,
  nixgl,
  ...
}: {
  home = {
    username = "ontu";
    homeDirectory = "/home/ontu";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    stateVersion = "23.11";
  };

  imports = [
    ../../home/cli
  ];

  nixGL.packages = nixgl.packages;
  programs.wezterm.package = config.lib.nixGL.wrap pkgs.wezterm;
  programs.home-manager.enable = true;
}
