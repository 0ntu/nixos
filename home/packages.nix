{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    firefox
    easyeffects
    webcord-vencord
    discord
    wezterm
    tor-browser
    cargo
    alejandra
  ];
}
