{ pkgs, wrappers }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.lsd;
  flags = {
    "--config-file" = ./config.yaml;
  };
}
