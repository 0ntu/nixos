{...}: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./hyprland.nix
  ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
