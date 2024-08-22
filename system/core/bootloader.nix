{
  machine,
  lib,
  ...
}: let
  predefined-entries = ./boot-entries/${machine}.cfg;
in {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      gfxmodeEfi = lib.mkDefault "1920x1080";

      useOSProber = if builtins.pathExists predefined-entries then false else true;
      extraEntries = if (builtins.pathExists predefined-entries) then builtins.readFile predefined-entries else "";
    };
  };
}
