{pkgs, ...}: {
  services.xserver = {
    enable = true;
    desktopManager.cinnamon.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    xclip
    catppuccin-gtk
    papirus-icon-theme
  ];
}
