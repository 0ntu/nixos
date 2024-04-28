{pkgs, ...}: {
  fonts.packages = with pkgs; [
    (nerdfonts.override {fonts = ["FiraCode"];})
    (nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];
}
