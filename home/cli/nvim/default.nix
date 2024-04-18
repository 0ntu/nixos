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
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
  };

  home.file."./.config/nvim/" = {
  	source = ./config;
	recursive = true;
  };
}
