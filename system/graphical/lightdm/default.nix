{...}: let
  wallpaper = builtins.path {path = ./wallpaper.png;};
in {
  services.xserver = {
    displayManager.lightdm = {
      enable = false;
      greeters.slick.extraConfig = ''
        background=${wallpaper}
      '';
    };
    displayManager.startx.enable = true;
  };
}
