{
  inputs,
  outputs,
  machine,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit outputs;
      inherit machine;
    };
    users.ontu = {
      imports = [./home.nix];
    };
  };
}
