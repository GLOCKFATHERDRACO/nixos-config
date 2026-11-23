{
  # -- cpu
  hardware.cpu.amd.updateMicrocode = true;

  # -- boot
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];

  # -- gpu
  boot.initrd.kernelModules = ["amdgpu"];
  boot.kernelModules = ["kvm-amd"];
  boot.kernelParams = ["amd_pstate=active"];
}
