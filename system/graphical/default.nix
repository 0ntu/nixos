{pkgs, ...}: {
  imports = [
    ./fonts.nix
    ./pipewire.nix
    ./x11.nix
    ./lightdm
    ./hyprland.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
        intel-media-driver
        vaapiVdpau
        libvdpau-va-gl
    ];
  };
}
