{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim = {
      url = "./home/cli/neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
        ];
      };
    }
;
    packages.${system}.neovim = import ./home/cli/neovim {
      inherit nixpkgs;
      inherit inputs;
      nixCats = inputs.nixCats;
   };
  };
}
