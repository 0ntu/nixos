{pkgs, ...}: {
  programs.bat = {
    enable = true;
    # themes = {
    #   src = pkgs.fetchFromGitHub {
    #     owner = "catppuccin";
    #     repo = "bat"; # 
    #     rev = "26c57ec282abcaa76e57e055f38432bd827ac34e";
    #     sha256 = "019hfl4zbn4vm4154hh3bwk6hm7bdxbr1hdww83nabxwjn99ndhv";
    #   };
    #   file = "Catppuccin Mocha.tmTheme";
    # };
  };
}
