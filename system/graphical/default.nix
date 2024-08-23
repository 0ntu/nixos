{...}: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./x11.nix
    ./lightdm
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
