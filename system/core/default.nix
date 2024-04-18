{...}: {
  imports = [
    ./bootloader.nix
    ./nix.nix
    ./users.nix
    ./packages.nix
    ./system.nix
    ./networking.nix
  ];
}
