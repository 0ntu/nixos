{
  machine,
  lib,
  ...
}: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };

    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      gfxmodeEfi = lib.mkDefault "1920x1080";

      useOSProber = true;
    };
  };
}
