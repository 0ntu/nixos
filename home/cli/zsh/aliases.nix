{machine, ...}: {
  rbs = "nh os switch /etc/nixos -H ${machine}";
  rbt = "nh os test /etc/nixos -H ${machine}";
  lg = "lazygit";
  cat = "bat";
  vim = "nvim";
  ls = "lsd";
  tree = "lsd --tree";
}
