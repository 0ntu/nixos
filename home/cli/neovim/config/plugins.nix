{
  plugins = {
    oil.enable = true;
    web-devicons.enable = true;
    sleuth.enable = true;
    nvim-autopairs.enable = true;
    fidget.enable = true;
    comment.enable = true;
    lz-n.enable = true; # Lazy Loading
    telescope.enable = true;
    harpoon.enable = true;
    gitsigns.enable = true;
    rustaceanvim.enable = true;
    which-key.enable = true;
    alpha = {
      enable = true;
      theme = "dashboard";
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
      };
    };

    mini-surround = {
      enable = true;
      settings = {
        mappings = {
          add = ";;";
          delete = ";d";
          find = ";f";
          find_left = ";F";
          highlight = ";h";
          replace = ";r";
          update_n_lines = ";n";
        };
      };
    };

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

    lspkind.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        signature.enabled = true;
        completion.ghost_text.enabled = true;

        completion.list.selection = {
          auto_insert = true;
        };

        keymap = {
          preset = "enter";
          "<Tab>" = [
            "select_next"
            "snippet_forward"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "snippet_backward"
            "fallback"
          ];
        };
      };
    };

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
