{...}: {
  programs.git = {
    enable = true;
    userName = "Ontu";
    userEmail = "73860587+0ntu@users.noreply.github.com";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };
}
