{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = import ./aliases.nix {};
    initExtra = ''
      bindkey '^[[Z' autosuggest-accept
    '';
  };
}
