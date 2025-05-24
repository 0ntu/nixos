{pkgs, ...}: {
  programs.zsh.enable = true;
  users = {
    users.ontu = {
      isNormalUser = true;
      description = "ontu";
      shell = pkgs.zsh;
      extraGroups = ["networkmanager" "wheel" "libvirtd" "docker" ];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINEeuNKcX3LhltjiwWdHmrD2h78w4vQxrv9k0aZxkb+X framework"
      ];

      # for nixos-rebuild vms!
      initialPassword = "P@ssword123!";
    };
  };
}
