{
  inputs,
  machine,
  pkgs-stable,
  nvim,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit machine;
      inherit pkgs-stable;
      inherit nvim;
    };
    users.ontu = {
      imports = [./home.nix];
    };
  };
}
