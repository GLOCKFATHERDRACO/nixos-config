{stateVersion, ...}: {
  nixpkgs.config.allowUnfree = true;

  nix = {
    channel.enable = false;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://nyx-cache.chaotic.cx/"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "nyx-cache.chaotic.cx:dJxTrgMC3V3cFfyIiBQDQorG6k1LsqurH/srpMSq7qk="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  programs.nix-ld.enable = true;
  documentation.nixos.enable = false;
  system.stateVersion = stateVersion;
}
