{
  ...
}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
          window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
          -- front_end = "WebGpu",
          enable_wayland = false,
          color_scheme = "Catppuccin Mocha",
          audible_bell = "Disabled",
          enable_tab_bar = false,
          font = wezterm.font 'Cousine',
          font_size = 10.0,
          default_cursor_style = 'SteadyBlock',
          keys = {
            {
              key = '\\',
              mods = 'ALT',
              action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
            },
            {
              key = '-',
              mods = 'ALT',
              action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
            },
            {
              key = 'h',
              mods = 'ALT',
              action = wezterm.action.ActivatePaneDirection 'Left',
            },
            {
              key = 'l',
              mods = 'ALT',
              action = wezterm.action.ActivatePaneDirection 'Right',
            },
            {
              key = 'k',
              mods = 'ALT',
              action = wezterm.action.ActivatePaneDirection 'Up',
            },
            {
              key = 'j',
              mods = 'ALT',
              action = wezterm.action.ActivatePaneDirection 'Down',
            },
            {
              key = 'q',
              mods = 'CTRL|SHIFT',
              action = wezterm.action.CloseCurrentPane { confirm = false },
            },
          },
        }
    '';
  };
}
