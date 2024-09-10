{
	inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    alejandra
    lazygit
    nvd
    nh
    inputs.neovim.packages."x86_64-linux".default
  ];
}
