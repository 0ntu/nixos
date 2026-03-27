{ pkgs, litellmConfig ? null, ... }:
{
  plugins = {
    oil.enable = true;
    web-devicons.enable = true;
    guess-indent.enable = true;
    trouble.enable = true;
    fidget.enable = true;
    comment.enable = true;
    lz-n.enable = true; # Lazy Loading
    telescope.enable = true;
    harpoon.enable = true;
    gitsigns.enable = true;
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
        autotools_ls.enable = true;
        jsonls.enable = true;
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

    lspkind.enable = true; # icons for lsp and completion
    snacks.enable = true;

    codecompanion = {
      enable = true;
      settings = {
        adapters = {
          acp = {
            claude_code.__raw = ''
              function()
                return require("codecompanion.adapters").extend("claude_code", {
                  env = {
                    CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
                  },
                })
              end
            '';
          };
        } // (if litellmConfig != null then {
          http = {
            litellm.__raw = ''
              function()
                return require("codecompanion.adapters").extend("openai_compatible", {
                  env = {
                    url = "${litellmConfig.url}",
                    api_key = "${litellmConfig.apiKey}",
                  },
                  schema = {
                    model = {
                      default = "${litellmConfig.model}",
                    },
                  },
                })
              end
            '';
          };
        } else {});
        strategies = if litellmConfig != null then {
          chat = {
            adapter = "litellm";
          };
          inline = {
            adapter = "litellm";
          };
        } else {};
      };
    };

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
  };

  extraPackages = with pkgs; [
    nixfmt
    ruff
    shfmt
    ripgrep
  ];
}
