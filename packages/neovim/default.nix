{ nixvim, system, ollamaUrl ? null }:
let
  nixvimLib = nixvim.lib.${system};
  nixvim' = nixvim.legacyPackages.${system};
  nixvimModule = {
    inherit system;
    module = import ./config;
    extraSpecialArgs = { inherit ollamaUrl; };
  };
in
nixvim'.makeNixvimWithModule nixvimModule
