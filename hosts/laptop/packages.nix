{pkgs, pkgs-stable, ...}: {
  home.packages = with pkgs; [
    syncthing
    pfetch
    btop
    arduino-ide
    android-studio
    pkgs-stable.vagrant

    gns3-gui
    gns3-server
    dynamips
    vpcs
    tigervnc

    gimp
  ];
}
