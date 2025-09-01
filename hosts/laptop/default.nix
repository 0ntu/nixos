{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
  ];
  networking.firewall.enable = false;
  # services.gns3-server = {
  #   enable = true;
  #   dynamips.enable = true;
  #   vpcs.enable =true;
  # };
  services.openssh.enable = false;
  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "wheel";
    permissions = "u+rx,g+x";
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "ontu";
  };
}
