{
  pkgs,
  wrappers,
  outputs,
  system,
}:
let

  extraConfig = ''
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    # source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
    source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source ${pkgs.zsh-z}/share/zsh-z/zsh-z.plugin.zsh

    export LS_COLORS='di=01;93:';

    eval "$(zoxide init zsh)"
  '';

  zdotdir = pkgs.runCommand "zdotdir" {} ''
    mkdir -p $out
    cp ${./zshrc} $out/.zshrc

    chmod +w $out/.zshrc
    cat >> $out/.zshrc <<'EOF'
    ${extraConfig}
    EOF
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
    pkgs.zoxide
    outputs.packages.${system}.lsd
    outputs.packages.${system}.starship
    outputs.packages.${system}.lazygit
  ];

  env = {
    ZDOTDIR = zdotdir;
  };
}
