{pkgs, ...}: {
  colorschemes = {
    kanagawa.enable = true;
    kanagawa.settings.background.dark = "wave";
  };

  extraPlugins = with pkgs.vimPlugins; [
    onedark-nvim
    tokyonight-nvim
    vscode-nvim
    rose-pine
    everforest
    oxocarbon-nvim
  ];

  opts = {
    number = true;
    relativenumber = true;
    termguicolors = true;

    wrap = false;
    undofile = true;

    ignorecase = true;
    smartcase = true;

    cursorline = true;
    colorcolumn = "100";

    clipboard = {
      providers.wl-copy.enable = true;
      providers.xclip.enable = true;
    };

    timeout = true;
    timeoutlen = 300;
  };

highlight = {
  YankSystemClip = {
    bg = "#d7ff87"; # Light Green background
    fg = "#000000"; # Black text
  };
};

  autoCmd = [
    {
      event = "TextYankPost";
      pattern = "*";
      callback = {
        __raw = ''
            function()
            -- Check if the register is the system clipboard
            if vim.v.event.regname == "+" then
              -- Use a distinct highlight group (e.g., 'Visual', 'Search', 'DiffAdd')
              vim.highlight.on_yank({ higroup = "YankSystemClip" })
            else
              -- Default behavior (uses 'IncSearch' by default)
              vim.highlight.on_yank()
            end
          end
        '';
      };
    }
  ];
}
