{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    firefox
    discord
    wezterm
    headsetcontrol
    easyeffects
    tor-browser
    libreoffice
    obsidian
    vlc
    keepassxc
    zoom-us
    signal-desktop
    comma
    
    lan-mouse
  ];

  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
