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
    HISTSIZE="10000"
    SAVEHIST="10000"

    HISTFILE="$HOME/.zsh_history"
    bindkey -e

    setopt HIST_FCNTL_LOCK
    unsetopt APPEND_HISTORY
    setopt HIST_IGNORE_DUPS
    unsetopt HIST_IGNORE_ALL_DUPS
    unsetopt HIST_SAVE_NO_DUPS
    unsetopt HIST_FIND_NO_DUPS
    setopt HIST_IGNORE_SPACE
    unsetopt HIST_EXPIRE_DUPS_FIRST
    setopt SHARE_HISTORY
    unsetopt EXTENDED_HISTORY
    unsetopt MENU_COMPLETE
    setopt AUTO_MENU

    zstyle ':completion:*' menu select
    bindkey '^[[Z' reverse-menu-complete

    alias -- cat=bat
    alias -- lg=lazygit
    alias -- ls=lsd
    alias -- tree='lsd --tree'
    alias -- vim=nvim
    alias -- du=dua
    alias -- df=duf
    alias -- sl=ls

    autoload -U compinit; compinit

    eval "$(starship init zsh)"
    export TERM=xterm-256color

    eval "$(zoxide init zsh)"
  '';

  zdotdir = pkgs.runCommand "zdotdir" {} ''
    mkdir -p $out
    touch $out/.zshrc

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
