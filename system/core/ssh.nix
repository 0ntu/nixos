{lib, ...}: {
  services.openssh = {
    enable = lib.mkDefault false;
    settings = {
      PermitRootLogin = lib.mkForce "no";
      PasswordAuthentication = lib.mkForce false;
    };
  };
}
