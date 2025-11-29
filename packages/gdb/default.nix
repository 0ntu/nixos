{ pkgs, pwndbg, wrappers, system }:
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pwndbg.packages.${system}.default;
  exePath = "${pwndbg.packages.${system}.default}/bin/pwndbg";
  binName = "gdb";
  flags = {
    "--init-command" = toString ./gdbinit;
  };
}
