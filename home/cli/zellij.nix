{...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-mocha";
      pane_frames = false;
      keybinds.normal = {
        # "bind r\"Ctrl \\\"" = {
        #   ToggleFloatingPanes = {};
        #   SwitchToMode = {
        #     _args = [ "normal" ];
        #   };
        # };
      };
    };
  };
}
