{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    nvd
    nh
    rclone
    magic-wormhole
    firefox
    discord
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
    outputs.packages."x86_64-linux".neovim
    outputs.packages."x86_64-linux".ghostty
    outputs.packages."x86_64-linux".shell
    input-leap
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
