{pkgs, ...}: {
  # host
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [virtiofsd];
  };
  programs.virt-manager.enable = true;

  # let virsh connect to system qemu (allows config through virt-manager & virsh)
  environment.variables = {LIBVIRT_DEFAULT_URI = "qemu:///system";};
}
