{ pkgs, wrappers }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.ghostty;
  env = {
    XDG_CONFIG_HOME = ./xdg;
  };
}
