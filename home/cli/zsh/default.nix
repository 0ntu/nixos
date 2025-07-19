{machine, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = import ./aliases.nix {inherit machine;};
    initContent = ''
      bindkey -e
      bindkey '^[[Z' autosuggest-accept
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
  };

  imports = [
    ./direnv.nix
    ./tools.nix
  ];
}
