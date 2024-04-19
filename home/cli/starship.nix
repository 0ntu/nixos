{...}: {
  programs.starship = {
    enable = true;
    settings = {
      hostname = {
        ssh_symbol = "󰢹";
        format = "[$ssh_symbol$hostname]($style)";
        ssh_only = false;
        style = "bold blue";
      };
      username = {
        show_always = true;
        format = ''[$user]($style)'';
        style_user = "bold blue";
      };
      directory = {
        format = ''[─](line_color)[\[](line_color)[$path]($style)[$read_only]($read_only_style)[\]](line_color)'';
        truncation_symbol = ".../";
        style = "bold green";
      };
      character = {
        success_symbol = ''[\$](bold blue)'';
        error_symbol = ''[\$](bold blue)'';
      };
      git_branch = {
        format = ''[─](line_color)[\[](line_color)[$symbol$branch(:$remote_branch)]($style)[\]](line_color)'';
      };
      git_status = {
        disabled = true;
      };

      format = ''
      [┌──](line_color)[\(](line_color)$username[](bold blue)$hostname[\)](line_color)$directory$git_branch
      [└─](line_color)$character
      '';

      right_format = ''
      $all

      '';

      palette = "catppuccin_mocha";
      palettes.catppuccin_mocha = rec {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";

        line_color = surface0;
      };
    };
  };
}
