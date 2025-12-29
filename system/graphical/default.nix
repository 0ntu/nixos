{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./gnome.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
        intel-media-driver
        libva-vdpau-driver
        libvdpau-va-gl
    ];
  };
}
