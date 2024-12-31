{
  inputs,
  outputs,
  machine,
  pkgs-stable,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
      inherit outputs;
      inherit machine;
      inherit pkgs-stable;
    };
    users.ontu = {
      imports = [./home.nix];
    };
  };
}
