{...}: {
  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"

    "i915"
  ];

  boot.kernelParams = [
    "intel_iommu=on"
    "vfio-pci.ids=1b73:1100"
  ];
}
