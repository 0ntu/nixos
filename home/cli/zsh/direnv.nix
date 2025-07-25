{lib, pkgs, ...}: {
  programs.direnv.enable = true;

  programs.zsh = {
    initContent = lib.mkAfter ''
          eval "$(direnv hook zsh)"
    '';
  };
}
