{ pkgs, ... }:
{
  plugins = {
    oil.enable = true;
    web-devicons.enable = true;
    sleuth.enable = true;
    trouble.enable = true;
    fidget.enable = true;
    comment.enable = true;
    lz-n.enable = true; # Lazy Loading
    telescope.enable = true;
    harpoon.enable = true;
    gitsigns.enable = true;
    rustaceanvim.enable = true;
    which-key.enable = true;

    nvim-autopairs = {
      enable = true;
      settings = {
        enable_moveright = true;
      };
    };

    spectre = {
      enable = true;
      settings = {
        color_devicons = true;
      };
    };

    alpha = {
      enable = true;
      theme = "dashboard";
    };

    treesitter = {
      enable = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
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
          section_separators = {
            left = "";
            right = "";
          };
        };
        sections = {
          lualine_b = [
            "diagnostics"
            "branch"
          ];
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        nil_ls.enable = true;
        bashls.enable = true;
        basedpyright = {
          enable = true;
          settings = {
            basedpyright = {
              disableOrganizeImports = true; # Use Ruff's import organizer
              analysis = {
                ignore = [ "*" ]; # Ignore files for analysis, use ruff for linting
              };
            };
          };
        };
        ruff = {
          enable = true;
          onAttach.function = ''
            client.server_capabilities.hoverProvider = false
          '';
        };
      };
    };

    conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        formatters_by_ft = {
          python = [ "ruff_format" ];
          nix = [ "nixfmt" ];
          bash = [ "shfmt" ];
          sh = [ "shfmt" ];
        };
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

    avante = {
      enable = true;
      settings = {
        diff = {
          autojump = true;
          debug = false;
          list_opener = "copen";
        };
        highlights = {
          diff = {
            current = "DiffText";
            incoming = "DiffAdd";
          };
        };
        hints = {
          enabled = true;
        };
        mappings = {
          diff = {
            both = "cb";
            next = "]x";
            none = "c0";
            ours = "co";
            prev = "[x";
            theirs = "ct";
          };
        };
        provider = "navigator";
        providers = {
          navigator = {
            __inherited_from = "openai";
            endpoint = "https://chat.ai.it.ufl.edu/api";
            api_key_name = "NAVIGATOR_API_KEY";
            model = "claude-4.5-sonnet";
            extra_request_body = {
              temperature = 1;
              max_tokens = 8192;
            };
          };
        };
        windows = {
          sidebar_header = {
            align = "center";
            rounded = true;
          };
          width = 30;
          wrap = true;
        };
      };
    };
  };

  extraPackages = with pkgs; [
    nixfmt-rfc-style
    ruff
    shfmt
    ripgrep
  ];
}
