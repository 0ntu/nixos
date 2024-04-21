{pkgs, ...}: {
  services.greetd = {
    enable = false;
    settings = {
      default_session = {
        command = "${pkgs.hyprland}/bin/Hyprland";
      };
    };
  };
  
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
    rofi-wayland
    swww
  ];
}
