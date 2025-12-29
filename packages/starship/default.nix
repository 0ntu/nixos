{ pkgs, wrappers }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.starship;
  env = {
    STARSHIP_CONFIG = ./starship.toml;
  };
}
