{ pkgs, wrappers, ... }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.kitty;
  flags = {
    "--config" = toString ./config;
  };
  flagSeparator = "=";
}
