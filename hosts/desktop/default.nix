{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./gpu-passthrough.nix
  ];
  networking.firewall.enable = false;
  services.openssh.enable = true;
  # virtualisation.vmware.host = {
  #   enable = true;
  # };

  services.openssh.settings = {
    AllowUsers = [ "ontu" ];
  };

  security.wrappers.ubridge = {
    source = "${pkgs.ubridge}/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "wheel";
    permissions = "u+rx,g+x";
  };

  services.syncthing = {
    enable = true;
    user = "ontu";
  };
}
