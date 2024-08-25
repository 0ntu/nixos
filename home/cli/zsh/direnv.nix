{lib, pkgs, ...}: {
  programs.direnv.enable = true;

  programs.zsh = {
    initExtra = lib.mkAfter ''
          eval "$(direnv hook zsh)"
    '';
  };
}
