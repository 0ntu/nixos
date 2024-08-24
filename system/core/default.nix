{...}: {
  imports = [
    ./bootloader.nix
    ./nix.nix
    ./users.nix
    ./devpkgs.nix
    ./system.nix
    ./networking.nix
  ];
}
