{...}: {
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      device = "nodev";
      gfxmodeEfi = "1920x1080";
    };
  };
}
