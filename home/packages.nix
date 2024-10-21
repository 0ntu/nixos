{pkgs, inputs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    firefox
    discord
    wezterm
    headsetcontrol
    easyeffects
    tor-browser
    libreoffice
    obsidian
    cool-retro-term
    inputs.neovim.packages."x86_64-linux".default
  ];
}
