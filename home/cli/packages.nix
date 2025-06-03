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
    outputs.packages."x86_64-linux".neovim
    rclone
  ];
}
