{
  plugins = {
    oil.enable = true;
    treesitter.enable = true;
    web-devicons.enable = true;
    sleuth.enable = true;
    nvim-autopairs.enable = true;
    fidget.enable = true;
    comment.enable = true;
    mini-surround.enable = true;
    lz-n.enable = true; # Lazy Loading
    telescope.enable = true;
    harpoon.enable = true;
    gitsigns.enable = true;
    rustaceanvim.enable = true;

    lualine = {
      enable = true;
      settings = {
        options = {
          component_separators = "|";
          section_separators = { left = ""; right = ""; };
        };
        sections = {
            lualine_b = ["diagnostics" "branch"];
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        nil_ls.enable = true;
        bashls.enable = true;
        basedpyright.enable = true;
      };
    };

    cmp = {
      enable = true;
    };
    cmp-nvim-lsp.enable = true;
    lspkind.enable = true;

    none-ls = {
      enable = true;
      settings = {
        cmd = ["bash -c nvim"];
        debug = true;
      };

      sources = {
        code_actions = {
          gitsigns.enable = true;
          statix.enable = true;
        };
        diagnostics = {

        };
        formatting = {
          nixfmt.enable = true;
        };
      };
    };
  };
}
