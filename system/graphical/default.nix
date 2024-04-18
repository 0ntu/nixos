{...} : {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./x11.nix
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
