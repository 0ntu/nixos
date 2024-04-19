{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      alejandra
      lua-language-server
    ];
    plugins = [
      pkgs.vimPlugins.lazy-nvim
    ];
  };

  home.file."./.config/nvim/" = {
    source = ./config;
    recursive = true;
  };

  # treesitter fix
  xdg.configFile."nvim/parser".source = "${pkgs.symlinkJoin {
    name = "treesitter-parsers";
    paths = (pkgs.vimPlugins.nvim-treesitter.withAllGrammars).dependencies;
  }}/parser";
}
