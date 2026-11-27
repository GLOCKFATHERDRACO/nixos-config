{
  inputs,
  lib,
  pkgs,
  system,
  ...
}: {
  config = lib.mkIf system.roblox {
    home.packages = [
      inputs.quadra.packages.${pkgs.stdenv.hostPlatform.system}.quadra
    ];
  };
}
