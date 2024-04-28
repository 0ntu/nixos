{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        output = "HDMI-A-1";
        position = "left";
        modules-left = ["hyprland/window"];
        modules-center = [];
        modules-right = ["clock" "tray"];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{icon}";
          format-icons = {default = "";};
        };

        pulseaudio = {
          format = " {icon} ";
          format-muted = "ﱝ";
          format-icons = ["奄" "奔" "墳"];
          tooltip = true;
          tooltip-format = "{volume}%";
        };

        network = {
          format-wifi = " ";
          format-disconnected = "睊";
          format-ethernet = " ";
          tooltip = true;
          tooltip-format = "{signalStrength}%";
        };

        clock = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = ''
             {:%d
             %m
            %Y}'';
          format = ''
            {:%H
            %M}'';
        };

        tray = {
          icon-size = 21;
          spacing = 10;
        };
      };
    };

    style = builtins.readFile ./style.css;
  };

  xdg.configFile."waybar/mocha.css".text =
    builtins.readFile ./mocha.css;
}
