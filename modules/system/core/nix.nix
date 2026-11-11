{ system, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    channel.enable = false;

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://nix-community.cachix.org"
        "https://nix-cache.tokidoki.dev/tokidoki"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "tokidoki:MD4VWt3kK8Fmz3jkiGoNRJIW31/QAm7l1Dcgz2Xa4hk="
      ];
    };
  };

  programs = {
    nix-ld.enable = true;
    nix-index.enable = true;
  };

  documentation.nixos.enable = false;
  system.stateVersion = system.state;
}
