{lib, ...}: {
  programs.neovim = {
    enable = true;
  };

  xdg.configFile."nvim".source = lib.mkOutOfStoreSymlink ./neovim;
}
