{pkgs, pkgs-stable, ...}: {
  home.packages = with pkgs; [
    headsetcontrol
    syncthing
    pfetch
    btop
    prismlauncher
    android-studio
    vagrant

    terraform

    gns3-gui
    gns3-server
    dynamips
    vpcs
    tigervnc
  ];
}
