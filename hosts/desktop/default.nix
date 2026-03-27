{ pkgs, lib, inputs, outputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./passthrough.nix
    ./unifiedllm-container.nix
  ];

  # Desktop-specific neovim with litellm configured
  environment.systemPackages = [
    outputs.packages."x86_64-linux".neovim-desktop-litellm
  ] ++ (with pkgs; [
    clockify
    xenia-canary
    jetbrains.idea-oss
    android-studio
    gnome-monitor-config
    google-chrome

    (prismlauncher.override {
      jdks = [
        zulu25
        zulu8
      ] ;
    })
  ]);

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

  # Fix Tailscale DNS after suspend/resume
  systemd.services.tailscale-restart-after-sleep = {
    description = "Restart Tailscale after suspend";
    after = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];
    wantedBy = [ "suspend.target" "hibernate.target" "hybrid-sleep.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl restart tailscaled.service";
    };
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
