{ pkgs, ghostty, wrappers, ... }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = ghostty;
  env = {
    XDG_CONFIG_HOME = ./xdg;
  };
}
