{pkgs, inputs, ...}:
{
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  #   extraOptions = [
  #     "--unsupported-gpu"
  #   ];
  #   xwayland.enable = true;

  #   # Default: -foot, -pulseaudio
  #   extraPackages = with pkgs; [
  #     brightnessctl
  #     grim
  #     swayidle
  #     swaylock
  #     wmenu
  #   ];
  # };

  programs.river.enable = true;

  programs.waybar = {
    enable = true;
  };

  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
