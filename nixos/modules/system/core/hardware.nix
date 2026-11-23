{
  hardware.enableRedistributableFirmware = true;

  services = {
    fstrim.enable = true;
    fwupd.enable = true;
  };

  zramSwap.enable = true;
}
