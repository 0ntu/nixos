{...}: {
  imports = [
    ./bootloader.nix
    ./nix.nix
    ./users.nix
    ./pkgs.nix
    ./system.nix
    ./networking.nix
    ./ssh.nix
  ];
}
