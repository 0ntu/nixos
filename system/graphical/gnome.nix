{pkgs, ...}: {
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # To disable installing GNOME's suite of applications
  # and only be left with GNOME shell.
  services.gnome.core-apps.enable = true;
  services.gnome.core-developer-tools.enable = true;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];

  environment.variables = {
    GSK_RENDERER = "ngl";
  };

  environment.systemPackages = with pkgs; [
    gnomeExtensions.tiling-shell
    gnomeExtensions.launch-new-instance
    gnomeExtensions.paperwm
    gnomeExtensions.appindicator
    gnome-tweaks
    xclip
    catppuccin-gtk
    libnotify
    papirus-icon-theme
  ];
}
