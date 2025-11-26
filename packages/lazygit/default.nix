{ pkgs, wrappers }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.lazygit;
  flags = {
    "--use-config-dir" = "$HOME/.config/lazygit";
  };
}
