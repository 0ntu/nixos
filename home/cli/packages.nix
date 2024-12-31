{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    lazygit
    nvd
    nh
    outputs.packages.${outputs.${system}}.neovim
  ];
}
