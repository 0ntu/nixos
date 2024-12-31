{...}: {
  # host
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  # let virsh connect to system qemu (allows config through virt-manager & virsh)
  environment.variables = { LIBVIRT_DEFAULT_URI = "qemu:///system"; };

  # guest
  # virtualisation.virtualbox.guest.enable = true;
  # virtualisation.virtualbox.guest.clipboard = true;
  # virtualisation.virtualbox.guest.dragAndDrop = true;
}
