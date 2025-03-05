{pkgs, pkgs-stable, ...}: {
  home.packages = with pkgs; [
    syncthing
    pfetch
    arduino-ide
    pkgs-stable.vagrant
  ];
}
