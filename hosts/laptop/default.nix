{
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./bootloader.nix
  ];

  environment.systemPackages = [
    outputs.packages."x86_64-linux".neovim
    inputs.meridian.packages."x86_64-linux".meridian
  ];

  networking.firewall.enable = false;

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

  # Fix Tailscale DNS after suspend/resume
  systemd.services.tailscale-restart-after-sleep = {
    description = "Restart Tailscale after suspend";
    after = [
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
    ];
    wantedBy = [
      "suspend.target"
      "hibernate.target"
      "hybrid-sleep.target"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl restart tailscaled.service";
    };
  };

  services.tailscale = {
    enable = true;
  };
}
