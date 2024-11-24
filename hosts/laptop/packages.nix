{pkgs, ...}: {
  home.packages = with pkgs; [
    syncthing
    pfetch
    arduino-ide
  ];
}
