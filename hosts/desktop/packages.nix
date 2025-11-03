{pkgs, ...}: {
  home.packages = with pkgs; [
    headsetcontrol
    pfetch
    btop
    prismlauncher
    android-studio
    vagrant

    terraform
    wireshark
    openconnect

    gns3-gui
    gns3-server
    dynamips
    vpcs
    tigervnc
    gimp

    distrobox

    gnome-monitor-config
    gnomeExtensions.gsconnect

    tmux
  ];
}
