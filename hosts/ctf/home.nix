{
  inputs,
  pkgs,
  lib,
  ...
}: let
  nixGLVulkanMesaWrap = pkg:
    pkgs.runCommand "${pkg.name}-nixgl-wrapper" { } ''
      mkdir $out
      ln -s ${pkg}/* $out
      rm $out/bin
      mkdir $out/bin
      for bin in ${pkg}/bin/*; do
       wrapped_bin=$out/bin/$(basename $bin)
       echo "${lib.getExe pkgs.nixgl.nixGLIntel} ${
         lib.getExe pkgs.nixgl.nixVulkanIntel
       } $bin \$@" > $wrapped_bin
       chmod +x $wrapped_bin
      done
  '';
in {

  home = {
    username = "ontu";
    homeDirectory = "/home/ontu";
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    stateVersion = "23.11";
  };

  imports = [
    ../../home/cli
  ];
  programs.wezterm.package = nixGLVulkanMesaWrap pkgs.wezterm;
  programs.home-manager.enable = true;
}
