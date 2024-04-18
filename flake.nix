{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    core = ./system/core;
    graphical = ./system/graphical;
    nvidia = ./system/nvidia.nix;
    virt = ./system/virt.nix;
    hmModule = inputs.home-manager.nixosModules.default;
    home-manager = {
      extraSpecialArgs = {inherit inputs;};
      users.ontu = {
        imports = [./home];
      };
    };
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          core
          hmModule
          graphical
          nvidia
          virt
          ./hosts/desktop
          {inherit home-manager;}
        ];
      };
    };
  };
}
