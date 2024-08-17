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
    system = "x86_64-linux";
    core = ./system/core;
    graphical = ./system/graphical;
    nvidia = ./system/nvidia.nix;
    virt = ./system/virt.nix;
    hmModule = inputs.home-manager.nixosModules.default;
    home-manager = ./home/manager.nix;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs; machine = "desktop";};
        modules = [
          core
          hmModule
          graphical
          nvidia
          virt
          home-manager
          ./hosts/desktop
        ];
      };
    };

    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
      in pkgs.mkShell {
        packages = with pkgs; [
        ];
      };
  };
}
