{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:BirdeeHub/nixCats-nvim";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    core = ./system/core;
    graphical = ./system/graphical;
    nvidia = ./system/nvidia.nix;
    virt = ./system/virt.nix;
    hmModule = inputs.home-manager.nixosModules.default;
    home-manager = ./home/manager.nix;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    nixos-hardware = inputs.nixos-hardware;
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          outputs = self;
          inherit inputs;
          inherit pkgs;
          inherit pkgs-stable;
          machine = "desktop";
        };
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
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          outputs = self;
          inherit inputs;
          inherit pkgs;
          inherit pkgs-stable;
          machine = "laptop";
        };
        modules = [
          core
          hmModule
          graphical
          virt
          home-manager
          ./hosts/laptop
          nixos-hardware.nixosModules.framework-11th-gen-intel
        ];
      };
    };

    packages.${system}.neovim = import ./home/cli/neovim {
      inherit nixpkgs;
      inherit inputs;
      inherit system;
      nixCats = inputs.nixCats;
    };
    
    packages."aarch64-darwin".neovim = import ./home/cli/neovim {
      inherit nixpkgs;
      inherit inputs;
      system = "aarch64-darwin";
      nixCats = inputs.nixCats;
    };
  };
}
