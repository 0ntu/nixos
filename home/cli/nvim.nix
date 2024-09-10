{config, pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs; [
      vimPlugins.lazy-nvim
    ];
    extraPackages = with pkgs; [
      nixfmt-rfc-style # Nix
      black # Python
      prettierd # Multi-language
      shfmt # Shell
      isort # Python
      stylua # Lua

      # LSP
      basedpyright
      rust-analyzer
      lua-language-server
      clang-tools #clangd
      nixd
      nil
      zls
      asm-lsp
      bash-language-server
      matlab-language-server

      # Tools
      cmake
      fzf
      gcc
      git
      gnumake
      sqlite
      tree-sitter
      luarocks
    ];
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home/cli/neovim";
  };
}
