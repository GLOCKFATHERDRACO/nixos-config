{
  allUsers,
  lib,
  ...
}: let
  inherit (import ./lib {inherit lib;}) validFiles;
in {
  imports = validFiles ./modules/system;

  config.home-manager.users = lib.genAttrs allUsers (_: {
    imports = validFiles ./modules/home;
  });
}
