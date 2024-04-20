{
  inputs,
  machine,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit machine;
    };
    users.ontu = {
      imports = [./home.nix];
    };
  };
}
