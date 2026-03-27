{ nixvim, system, litellmConfig ? null }:
let
  nixvimLib = nixvim.lib.${system};
  nixvim' = nixvim.legacyPackages.${system};
  nixvimModule = {
    inherit system;
    module = import ./config;
    extraSpecialArgs = { inherit litellmConfig; };
  };
in
nixvim'.makeNixvimWithModule nixvimModule
