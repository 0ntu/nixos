{...}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      return {
        window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
        color_scheme = "Catppuccin Mocha",
        audible_bell = "Disabled",
        enable_tab_bar = false,
        font = wezterm.font 'FiraCode Nerd Font Mono',
        default_cursor_style = 'SteadyBar',
      }
    '';
  };
}
