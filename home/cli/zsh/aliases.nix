{...}: {
  rbs = "sudo nixos-rebuild switch --flake /etc/nixos#desktop";
  rbb = "sudo nixos-rebuild build --flake /etc/nixos#desktop";
  lg = "lazygit";
  cat = "bat";
  ls = "ls -l --group-directories-first";
}
