{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./passthrough.nix
  ];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  services.openssh.enable = true;

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
