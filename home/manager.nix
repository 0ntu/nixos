{
  inputs,
  machine,
  pkgs-stable,
  pkgs-2205,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit machine;
      inherit pkgs-stable;
      inherit pkgs-2205;
    };
    users.ontu = {
      imports = [./home.nix];
    };
  };
}
