{
  inputs,
  machine,
  pkgs-stable,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit machine;
      inherit pkgs-stable;
    };
    users.ontu = {
      imports = [./home.nix];
    };
  };
}
