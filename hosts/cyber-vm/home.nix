{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "ontu";
    homeDirectory = "/home/ontu";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    packages = with pkgs; [
      neovim
    ];

    stateVersion = "23.11";
  };

  imports = [
    ../../home/cli
  ];

  programs.home-manager.enable = true;
}
