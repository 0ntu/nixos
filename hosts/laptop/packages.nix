{pkgs, ...}: {
  home.packages = with pkgs; [
    pfetch
    btop
    arduino-ide
    android-studio

    tigervnc

    openvpn
    openconnect

    #fun
    aircrack-ng
    wireshark
    prismlauncher
    iw

    wireguard-tools

    gimp
    google-chrome
  ];
}
