{...}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
  ];
  networking.firewall.enable = true;
  services.openssh.enable = false;
}
