{lib, ...}: {
  # networking.hostName = lib.mkOption {
  #   type = lib.types.str;
  # };
  networking.hostName = lib.mkDefault "nixos";
  networking.networkmanager.enable = true;
}
