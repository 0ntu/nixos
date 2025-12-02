{ pkgs, ghostty, wrappers, ... }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = ghostty;
  flags = {
    "--config-file" = toString ./config;
  };
  flagSeparator = "=";
}
