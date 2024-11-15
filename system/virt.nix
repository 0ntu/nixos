{...}: {
  # host
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # guest
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.clipboard = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
}
