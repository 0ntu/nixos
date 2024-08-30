{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-2205.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    nixpkgs-2205,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    core = ./system/core;
    graphical = ./system/graphical;
    nvidia = ./system/nvidia.nix;
    virt = ./system/virt.nix;
    hmModule = inputs.home-manager.nixosModules.default;
    home-manager = ./home/manager.nix;
    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs-2205 = import nixpkgs-2205 {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          inherit pkgs-stable;
          inherit pkgs-2205;
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
          inherit inputs;
          inherit pkgs-stable;
          inherit pkgs-2205;
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
    };

    /*
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
      in pkgs.mkShell {
        packages = with pkgs; [
        ];
      };
    */
  };
}
