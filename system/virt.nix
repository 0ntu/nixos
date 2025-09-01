{pkgs, machine, ...}: {
  # host
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [virtiofsd];
  };
  programs.virt-manager.enable = true;

  virtualisation.vmware.host.enable = if machine == "desktop" then true else false;

  # let virsh connect to system qemu (allows config through virt-manager & virsh)
  environment.variables = {LIBVIRT_DEFAULT_URI = "qemu:///system";};

  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.docker.enable = true;
}
