{pkgs, ...}: {
  # -- cpu
  hardware.cpu.intel.updateMicrocode = true;

  services.thermald.enable = true;

  # -- intel uhd 620
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
    VDPAU_DRIVER = "va_gl";
  };

  # -- boot
  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];

  # -- gpus
  boot.initrd.kernelModules = ["i915"];
  boot.kernelModules = ["kvm-intel"];
  boot.kernelParams = [
    "i915.enable_psr=0"
    "i915.enable_fbc=1"
  ];

  # -- nvidia geforce 930mx (optimus prime)
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    branch = "legacy_580";
    open = false;
    modesetting.enable = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      # -- PCI
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
