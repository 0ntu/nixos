{
  inputs,
  nixpkgs,
  nixCats,
  system,
}: let
  inherit (nixCats) utils;
  luaPath = "${./.}";
  forEachSystem = utils.eachSystem nixpkgs.lib.platforms.all;
  extra_pkg_config = {
    allowUnfree = true;
  };
  inherit
    (forEachSystem (system: let
      dependencyOverlays =
        /*
        (import ./overlays inputs) ++
        */
        [
          (utils.standardPluginOverlay inputs)
        ];
    in {inherit dependencyOverlays;}))
    dependencyOverlays
    ;
  categoryDefinitions = {
    pkgs,
    settings,
    categories,
    name,
    ...
  } @ packageDef: {
    propagatedBuildInputs = {
      general = with pkgs; [
      ];
    };
    lspsAndRuntimeDeps = with pkgs; {
      general = [
        nixfmt-rfc-style # Nix
        prettierd # Multi-language
        shfmt # Shell
        isort # Python
        stylua # Lua

        # LSP
        arduino-language-server
        basedpyright
        ruff
        rust-analyzer
        lua-language-server
        typescript-language-server
        clang-tools
        nixd
        zls
        asm-lsp
        bash-language-server

        # Tools
        cmake
        fzf
        gcc
        git
        gnumake
        sqlite
        tree-sitter
        luarocks
        ripgrep
      ];
    };

    # shared libraries to be added to LD_LIBRARY_PATH
    # variable available to nvim runtime
    sharedLibraries = {
      general = with pkgs; [
        # libgit2
      ];
    };

    environmentVariables = {
    };

    extraWrapperArgs = {
    };

    extraPython3Packages = {
    };
    # populates $LUA_PATH and $LUA_CPATH
    extraLuaPackages = {
    };
  };

  packageDefinitions = {
    nvim = {pkgs, ...}: {
      settings = {
        wrapRc = true;
        aliases = ["vim"];
        # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
      };
      categories = {
        general = true;
        gitPlugins = true;
        customPlugins = true;
      };
    };
  };
  defaultPackageName = "nvim";
in let
  nixCatsBuilder =
    utils.baseBuilder luaPath {
      inherit system;
      inherit nixpkgs dependencyOverlays extra_pkg_config;
    }
    categoryDefinitions
    packageDefinitions;
in
  nixCatsBuilder defaultPackageName
