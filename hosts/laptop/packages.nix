{pkgs, ...}: {
  home.packages = with pkgs; [
    syncthing
    pfetch
    btop
    arduino-ide
    android-studio

    gns3-gui
    gns3-server
    dynamips
    vpcs
    tigervnc

    openvpn
    openconnect

    #fun
    aircrack-ng
    wireshark
    prismlauncher
    iw

    gimp
  ];
}
