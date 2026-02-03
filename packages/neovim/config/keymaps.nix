{
  globals = {
    mapleader = " ";
  };

  keymaps = [
    # Splits
    {
      mode = "n";
      key = "<Leader>v";
      action = "<Cmd>vert split<CR>";
      options = {
        desc = "Vertical Split";
      };
    }
    {
      mode = "n";
      key = "<Leader>s";
      action = "<Cmd>split<CR>"; options = {
        desc = "Horizontal Split";
      };
    }
    {
      mode = "n";
      key = "<Leader>|";
      action = "<Cmd>vert split<CR>";
      options = {
        desc = "Vertical Split";
      };
    }
    {
      mode = "n";
      key = "<Leader>-";
      action = "<Cmd>split<CR>";
      options = {
        desc = "Horizontal Split";
      };
    }

    # Cursor Movement
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        desc = "Move cursor to left window";
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        desc = "Move cursor to right window";
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        desc = "Move cursor to down window";
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        desc = "Move cursor to up window";
      };
    }
    # Tabs
    {
      mode = "n";
      key = "<C-t>";
      action = ":tabnew<CR>";
      options = {
        desc = "New Tab";
      };
    }
    {
      mode = "n";
      key = "<C-n>";
      action = ":tabnext<CR>";
      options = {
        desc = "Next Tab";
      };
    }
    {
      mode = "n";
      key = "<C-p>";
      action = ":tabprev<CR>";
      options = {
        desc = "Prev Tab";
      };
    }
    {
      mode = "n";
      key = "<C-x>";
      action = ":tabclose<CR>";
      options = {
        desc = "Close Tab";
      };
    }

    # Plugins

    {
      mode = "n";
      key = "<leader>rp";
      action = ":Spectre<CR>";
      options = {
        desc = "[R]e[p]lace with Spectre";
      };
    }

    {
      mode = "n";
      key = "<S-TAB>";
      action = {
        __raw = ''
          function()
            require("oil").toggle_float()
          end
        '';
      };
      options = {
        desc = "Open Oil in a floating window";
      };
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = {
        __raw = '' require("telescope.builtin").keymaps '';
      };
      options = {
        desc = "[S]earch [k]eymaps";
      };
    }
    {
      mode = "n";
      key = "<leader>sb";
      action = {
        __raw = '' require("telescope.builtin").buffers '';
      };
      options = {
        desc = "[S]earch [b]uffers";
      };
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = {
        __raw = ''
          function()
            require("telescope.builtin").colorscheme({ enable_preview = true })
          end
        '';
      };
      options = {
        desc = "[S]earch [c]olorschemes";
      };
    }

    # Harpoon
    {
      mode = "n";
      key = "<leader>a";
      action = {
        __raw = ''
          function()
            require("harpoon"):list():add()
          end
        '';
      };
      options = {
        desc = "[A]dd to Harpoon list";
      };
    }
    {
      mode = "n";
      key = "<TAB>";
      action = {
        __raw = ''
          function()
            require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
          end
        '';
      };
      options = {
        desc = "Harpoon Quick Menu";
      };
    }

    # Trouble
    {
      mode = "n";
      key = "<leader>xx";
      action = ":Trouble diagnostics toggle<CR>";
      options = {
        desc = "Toggle Trouble Diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>xq";
      action = ":Trouble qflist toggle<CR>";
      options = {
        desc = "Toggle Trouble QuickFix List";
      };
    }

    # Formatting
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>f";
      action.__raw = ''
        function()
          require('conform').format({ async = true, lsp_fallback = true })
          
          -- If in visual mode, exit to normal mode
          local mode = vim.api.nvim_get_mode().mode
          if mode ~= 'n' then
            local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
            vim.api.nvim_feedkeys(esc, 'n', false)
          end
        end
      '';
      options = {
        desc = "Format buffer";
      };
    }
  ];

  lsp.keymaps = [
    {
      key = "gD";
      lspBufAction = "declaration";
    }
    {
      key = "gd";
      lspBufAction = "definition";
    }
    {
      key = "K";
      lspBufAction = "hover";
    }
    {
      key = "<Leader>rn";
      lspBufAction = "rename";
    }
    {
      key = "gr";
      lspBufAction = "references";
    }
    {
      key = "<Leader>ca";
      lspBufAction = "code_action";
    }
    {
      key = "<Leader>d";
      action.__raw = '' function() vim.diagnostic.open_float() end '';
      options = {
        desc = "Open LSP [d]iagnostic in a popup window";
      };
    }
  ];
}
