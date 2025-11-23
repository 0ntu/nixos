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
      action = "<Cmd>split<CR>";
      options = {
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

    # Plugins
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
  ];
}
