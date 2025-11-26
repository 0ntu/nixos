{ nixvim, system }:
let
  nixvimLib = nixvim.lib.${system};
  nixvim' = nixvim.legacyPackages.${system};
  nixvimModule = {
    inherit system;
    module = import ./config;
    extraSpecialArgs = { };
  };
in
nixvim'.makeNixvimWithModule nixvimModule
