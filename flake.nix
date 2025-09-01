{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl.url = "github:nix-community/nixGL";
  };

  outputs = { self, flake-utils, nixpkgs, nixgl, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        lib = nixpkgs.lib;
        nixCats = inputs.nixCats;
      in {
        packages.neovim = import ./home/cli/neovim {
          inherit nixpkgs inputs system nixCats;
        };

        packages.homeConfigurations = {
          ctf = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = import nixpkgs {
              inherit system;
            };
            modules = [ ./hosts/ctf/home.nix ];
            extraSpecialArgs = {
              outputs = self;
              machine = "ctf";
              inherit nixgl;
            };
          };
        };
      }
    ) // {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            outputs = self;
            inherit inputs;
            machine = "desktop";
          };
          modules = [
            ./system/core
            inputs.home-manager.nixosModules.default
            ./system/graphical
            ./system/nvidia.nix
            ./system/virt.nix
            ./home/home.nix
            ./hosts/desktop
          ];
        };

        laptop = nixpkgs.lib.nixosSystem {
          specialArgs = {
            outputs = self;
            inherit inputs;
            machine = "laptop";
          };
          modules = [
            ./system/core
            inputs.home-manager.nixosModules.default
            ./system/graphical
            ./system/virt.nix
            ./home/home.nix
            ./hosts/laptop
            inputs.nixos-hardware.nixosModules.framework-11th-gen-intel
          ];
        };
      };
    };
}
