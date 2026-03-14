{ pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./passthrough.nix
  ];

  environment.systemPackages = with pkgs; [
    xenia-canary
    jetbrains.idea-oss
    android-studio
    gnome-monitor-config

    (prismlauncher.override {
      jdks = [
        zulu25
      ] ;
    })
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

  services.sunshine = {
    autoStart = false;
    capSysAdmin = true;
    enable = true;
  };

  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
  '';

  # Moonlight Laptop Stream
  # hardware.display.edid.linuxhw."Moonlight_60" = [
  #   "BOE08BC"
  #   "2019"
  # ];
  # hardware.display.outputs."DP-4".mode = "e";
  # hardware.display.outputs."DP-4".edid = "Moonlight_60.bin";

  environment.etc."xdg/monitors.xml" = {
    source = "/home/ontu/.config/monitors.xml";
    mode = "0644"; # Set mode so the file is copied and accessible to GDM.
  };
}
