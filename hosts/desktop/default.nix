{...}: {
  imports = [
    ./hardware-configuration.nix
    ./audio-rename.nix
  ];
  networking.firewall.enable = false;
  services.openssh.enable = true;
}
