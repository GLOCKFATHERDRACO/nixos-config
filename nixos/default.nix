{
  allUsers,
  lib,
  ...
}: let
  # -- recursively collect every file in a directory as relative paths
  files = dir: let
    entries = builtins.readDir dir;
  in
    builtins.concatMap
    (name: let
      type = entries.${name};
    in
      if type == "directory"
      then map (file: "${name}/${file}") (files (dir + "/${name}"))
      else [name])
    (builtins.attrNames entries);

  # -- every .nix file in a directory as absolute paths
  validFiles = dir:
    map (file: dir + "/${file}")
    (builtins.filter
      (file:
        lib.hasSuffix ".nix" file
        && file != "default.nix"
        && ! lib.hasSuffix "-hm.nix" file)
      (files dir));
in {
  imports = validFiles ./modules/system;

  config.home-manager.users = lib.genAttrs allUsers (_: {
    imports = validFiles ./modules/home;
  });
}
