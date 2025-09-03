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

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
