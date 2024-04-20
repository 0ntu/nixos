{pkgs, ...}: {
  programs.zsh.enable = true;
  users = {
    users.ontu = {
      isNormalUser = true;
      description = "ontu";
      shell = pkgs.zsh;
      extraGroups = ["networkmanager" "wheel" "libvirtd"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUmrKruT4g5JOAPCFTVCT0rEYSntjyU9Omb473dvw96 vim@debian"
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIImIt8UHkzhzsYrUTU6c8gM19Z3pqtk89Wp9dvhJsQJY ontu@ontu-framework"
      ];
    };
  };
}
