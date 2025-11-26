{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    wrappers = {
      url = "github:Lassulus/wrappers";
      inputs.nixpkgs.follows = "nixpkgs";
    };



    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-utils = {
      url = "github:numtide/flake-utils";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim.url = "github:nix-community/nixvim";

    nixgl.url = "github:nix-community/nixGL";
  };

  outputs =
    {
      self,
      flake-utils,
      nixpkgs,
      nixgl,
      wrappers,
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
        packages.neovim = import ./packages/neovim {
          inherit system;
          nixvim = inputs.nixvim;
        };

        packages.ghostty = import ./packages/ghostty {
          inherit pkgs wrappers;
        };
        
        packages.lazygit = import ./packages/lazygit {
          inherit pkgs wrappers;
        };

        packages.lsd = import ./packages/shell/lsd {
          inherit pkgs wrappers;
        };
        
        packages.starship = import ./packages/shell/starship {
          inherit pkgs wrappers;
        };

        packages.shell = import ./packages/shell {
          inherit pkgs wrappers system; 
          outputs = self;
        };
      }
    )
    // {
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
