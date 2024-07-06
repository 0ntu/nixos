{pkgs, ...}: {
  services.xserver = {
    enable = true;
    desktopManager.budgie.enable = true;
    displayManager.lightdm.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    xclip
    catppuccin-gtk
  ];
}
