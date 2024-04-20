{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    firefox
    easyeffects
    webcord-vencord
    wezterm
    tor-browser
    cargo
  ];
}
