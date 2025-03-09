{pkgs, pkgs-stable, ...}: {
  home.packages = with pkgs; [
    syncthing
    pfetch
    arduino-ide
    android-studio
    pkgs-stable.vagrant
  ];
}
