{machine, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = import ./aliases.nix {inherit machine;};
    initExtra = ''
      bindkey -e
      bindkey '^[[Z' autosuggest-accept
    '';
  };
}
