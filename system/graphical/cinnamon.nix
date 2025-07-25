{pkgs, ...}: {
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    autoEnable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    xclip
    catppuccin-gtk
    libnotify
    papirus-icon-theme
  ];
}
