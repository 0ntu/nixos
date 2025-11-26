{
  pkgs,
  wrappers,
  outputs,
  system,
}:
let

  extraConfig = ''
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    bindkey -M emacs \
    "^[p"   .history-search-backward \
    "^[n"   .history-search-forward \
    "^P"    .up-line-or-history \
    "^[OA"  .up-line-or-history \
    "^[[A"  .up-line-or-history \
    "^N"    .down-line-or-history \
    "^[OB"  .down-line-or-history \
    "^[[B"  .down-line-or-history \
    "^R"    .history-incremental-search-backward \
    "^S"    .history-incremental-search-forward \
    #
bindkey -a \
    "^P"    .up-history \
    "^N"    .down-history \
    "k"     .up-line-or-history \
    "^[OA"  .up-line-or-history \
    "^[[A"  .up-line-or-history \
    "j"     .down-line-or-history \
    "^[OB"  .down-line-or-history \
    "^[[B"  .down-line-or-history \
    "/"     .vi-history-search-backward \
    "?"     .vi-history-search-forward \
    #
  '';

  zdotdir = pkgs.runCommand "zdotdir" {} ''
    mkdir -p $out
    cp ${./zshrc} $out/.zshrc

    chmod +w $out/.zshrc
    echo "${extraConfig}" >> $out/.zshrc
  '';
in
wrappers.lib.wrapPackage {
  inherit pkgs;
  package = pkgs.zsh;
  runtimeInputs = [
    pkgs.bat
    pkgs.duf
    pkgs.dua
    pkgs.nix
    outputs.packages.${system}.lsd
    outputs.packages.${system}.starship
    outputs.packages.${system}.lazygit
  ];

  env = {
    ZDOTDIR = zdotdir;
  };
}
