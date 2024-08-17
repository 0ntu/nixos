{...}: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./x11.nix
    ./lightdm
  ];

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };
}
