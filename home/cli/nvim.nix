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
      lua-language-server
      clang-tools
      nixd
      nil

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
