{...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  networking.firewall.enable = true;
  services.openssh.enable = false;
}
