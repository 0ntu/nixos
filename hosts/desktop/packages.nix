{pkgs, ...}: {
  home.packages = with pkgs; [
    headsetcontrol
    syncthing
    pfetch
    btop
    prismlauncher
  ];
}
