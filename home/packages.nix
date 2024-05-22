{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    firefox
    easyeffects
    discord
    wezterm
    headsetcontrol
    tor-browser
    rustup
  ];
}
