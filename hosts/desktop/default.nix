{...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  networking.firewall.enable = false;
  services.openssh.enable = true;
}
