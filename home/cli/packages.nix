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
    rclone
    magic-wormhole
  ];
}
