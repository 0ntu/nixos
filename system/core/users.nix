{pkgs, ...}: {
  programs.zsh.enable = true;
  users = {
    users.ontu = {
      isNormalUser = true;
      description = "ontu";
      shell = pkgs.zsh;
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
    };
  };
}
