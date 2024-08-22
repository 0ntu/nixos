{pkgs-stable, ...}: {
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
          window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
          front_end = "WebGpu",
          enable_wayland = false,
          color_scheme = "Catppuccin Mocha",
          audible_bell = "Disabled",
          enable_tab_bar = false,
          font = wezterm.font 'Cousine',
          font_size = 10.0,
          default_cursor_style = 'SteadyBlock',
      }
    '';
  };
}
