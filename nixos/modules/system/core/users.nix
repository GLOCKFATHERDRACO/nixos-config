{
  allUsers,
  lib,
  pkgs,
  system,
  ...
}: {
  programs.fish.enable = true;

  security.sudo.execWheelOnly = true;

  users.users = lib.genAttrs allUsers (username: {
    isNormalUser = true;
    description = username;
    shell = pkgs.fish;
    extraGroups =
      ["networkmanager" "tss"]
      ++ lib.optional (builtins.elem username system.admin) "wheel";
  });
}
