{
  colorschemes = {
    # tokyonight.enable = true;
    # everforest.enable = true;
    kanagawa.enable = true;
    kanagawa.settings.background.dark = "wave";
  };

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

  autoCmd = [
    {
      event = "TextYankPost";
      pattern = "*";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
  ];
}
