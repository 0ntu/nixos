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
    nvim.packages.default
  ];
}
