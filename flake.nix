{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    wrappers = {
      url = "github:Lassulus/wrappers";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pwndbg = {
      url = "github:pwndbg/pwndbg";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    nixvim.url = "github:nix-community/nixvim";

    nixgl.url = "github:nix-community/nixGL";

    nix-binary-ninja = {
      url = "github:jchv/nix-binary-ninja";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      nixgl,
      wrappers,
      pwndbg,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ nixgl.overlay ];
        };

      in
      {
        packages = import ./packages {
          inherit
            pkgs
            system
            inputs
            self
            ;
        };
      }
    )
    // {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            outputs = self;
            inherit inputs;
          };
          modules = [
            ./system/core
            ./system/graphical
            ./system/nvidia.nix
            ./system/virt.nix
            ./hosts/desktop
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            outputs = self;
            inherit inputs;
          };
          modules = [
            ./system/core
            ./system/graphical
            ./system/virt.nix
            ./hosts/laptop
            inputs.nixos-hardware.nixosModules.framework-11th-gen-intel
          ];
        };
      };
    };
}
