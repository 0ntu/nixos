{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./passthrough.nix
  ];

  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 22 ];
  };

  services.openssh = {
    enable = true;
    settings = {
      AllowUsers = [ "ontu" ];
    };
  };

  services.syncthing = {
    enable = true;
    user = "ontu";
  };

  services.tailscale = {
    enable = true;
  };

  # services.sunshine = {
  #   enable = true;
  # };
  #
  # security.wrappers.sunshine = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_sys_admin+p";
  #   source = "${pkgs.sunshine}/bin/sunshine";
  # };

  environment.systemPackages = with pkgs; [
    prismlauncher
  ];

  # Moonlight Laptop Stream
  # hardware.display.edid.linuxhw."Moonlight_60" = [
  #   "BOE08BC"
  #   "2019"
  # ];
  # hardware.display.outputs."DP-5".mode = "e";
  # hardware.display.outputs."DP-5".edid = "Moonlight_60.bin";
}
