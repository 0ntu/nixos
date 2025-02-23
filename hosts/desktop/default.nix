{pkgs-stable, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];
  networking.firewall.enable = false;
  services.openssh.enable = true;
  virtualisation.vmware.host = {
    enable = true;
  };

  services.openssh.settings = {
    AllowUsers = [ "ontu" ];
  };


}
