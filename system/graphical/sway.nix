{pkgs, inputs, ...}:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
  ];
}
