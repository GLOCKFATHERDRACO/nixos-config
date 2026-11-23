{lib, ...}: let
  # -- shared btrfs options
  btrfsOptions = [
    "noatime"
    "compress=zstd"
    "discard=async"
  ];

  subvolume = mountpoint: {
    inherit mountpoint;
    mountOptions = btrfsOptions;
  };
in {
  disko.devices.disk.main = {
    type = "disk";
    device = lib.mkDefault "/dev/disk/by-id/nvme-BC501_NVMe_SK_hynix_256GB_CD98N625513108P6K";

    content = {
      type = "gpt";
      partitions = {
        ESP = {
          label = "EFI";
          type = "EF00";
          size = "2G";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = ["umask=0077"];
          };
        };

        root = {
          size = "100%";
          content = {
            type = "luks";
            name = "crypted";
            settings = {
              allowDiscards = true;
              bypassWorkqueues = true;
              crypttabExtraOpts = ["tpm2-device=auto"];
            };
            content = {
              type = "btrfs";
              extraArgs = ["-f"];
              subvolumes = {
                "/root" = subvolume "/";
                "/nix" = subvolume "/nix";
                "/home" = subvolume "/home";
              };
            };
          };
        };
      };
    };
  };
}
