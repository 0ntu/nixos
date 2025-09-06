{pkgs, inputs, ...}:
{
  programs.hyprland = {
    enable = false;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  programs.waybar = {
    enable = false;
  };

  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --remember-user-session";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  services.hypridle.enable = false;

  environment.systemPackages = with pkgs; [
    hyprlock
    xdg-utils
    rofi-wayland
    swww
    wl-clipboard
    jq
  ];
}
