{...}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
  ];
  networking.firewall.enable = false;
  services.openssh.enable = false;
}
