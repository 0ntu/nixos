local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- config.front_end = "WebGpu"
config.enable_wayland = false
config.color_scheme = "Afterglow"
config.audible_bell = "Disabled"
config.hide_tab_bar_if_only_one_tab = true
-- config.font = wezterm.font 'Cousine'
config.font_size = 10.0
config.default_cursor_style = 'SteadyBlock'

config.keys = {
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
    key = 'v',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 's',
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
    key = 'x',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'q',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
}

return config
