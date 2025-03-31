{pkgs, pkgs-stable, ...}: {
  home.packages = with pkgs; [
    headsetcontrol
    syncthing
    pfetch
    btop
    prismlauncher
    android-studio
    pkgs-stable.vagrant
    gimp
  ];
}
