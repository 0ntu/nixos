{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    inputs.myNeovim.packages.x86_64-linux.nvim
    alejandra
    lazygit
    unzip
    nvd
    nh
    bat
  ];
}
