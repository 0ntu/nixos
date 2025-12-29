{ pkgs, wrappers, ... }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.wezterm;
  flags = {
    "--config-file" = toString ./config.lua;
  };
  flagSeparator = "=";
}
