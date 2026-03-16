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
config.use_fancy_tab_bar = false;

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
    key = 't',
    mods = 'ALT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 'q',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ScrollByPage(1),
  },
  {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ScrollByPage(-1),
  },
  {
    key = '1',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(8),
  },
  {
    key = 'h',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'l',
    mods = 'ALT|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },
  {
    key = 'j',
    mods = 'ALT|SHIFT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = 'k',
    mods = 'ALT|SHIFT',
    action = wezterm.action.MoveTabRelative(1),
  },
}

return config
