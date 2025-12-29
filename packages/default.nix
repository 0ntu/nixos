{
  pkgs,
  system,
  inputs,
  self,
}:
let
  inherit (inputs) nixvim wrappers pwndbg;
  ghostty-pkg = inputs.ghostty.packages.${system}.default;
in
{
  neovim = import ./neovim {
    inherit system nixvim;
  };

  ghostty = import ./ghostty {
    inherit pkgs wrappers;
    ghostty = ghostty-pkg;
  };

  ghosttyGL = pkgs.writeShellScriptBin "ghostty" ''
    exec ${pkgs.nixgl.auto.nixGLDefault}/bin/nixGL ${self.packages.${system}.ghostty}/bin/ghostty "$@"
  '';

  kitty = import ./kitty {
    inherit pkgs wrappers;
  };

  kittyGL = pkgs.writeShellScriptBin "kitty" ''
    exec ${pkgs.nixgl.auto.nixGLDefault}/bin/nixGL ${self.packages.${system}.kitty}/bin/kitty "$@"
  '';

  wezterm = import ./wezterm {
    inherit pkgs wrappers;
  };

  weztermGL = pkgs.writeShellScriptBin "wezterm" ''
    exec ${pkgs.nixgl.auto.nixGLDefault}/bin/nixGL ${self.packages.${system}.wezterm}/bin/wezterm "$@"
  '';

  lazygit = import ./lazygit {
    inherit pkgs wrappers;
  };

  lsd = import ./lsd {
    inherit pkgs wrappers;
  };

  starship = import ./starship {
    inherit pkgs wrappers;
  };

  zsh = import ./zsh {
    inherit pkgs wrappers system;
    outputs = self;
  };

  gdb = import ./gdb {
    inherit
      pkgs
      pwndbg
      wrappers
      system
      ;
  };
}
