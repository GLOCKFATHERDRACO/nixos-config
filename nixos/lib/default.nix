{lib, ...}:
with lib; rec {
  # -- create a module option
  mkOpt = type: default: description:
    mkOption {inherit type default description;};

  # -- create a module option without a description
  mkOpt' = type: default: mkOpt type default null;

  # -- create a boolean module option
  mkBoolOpt = mkOpt types.bool;

  # -- create a boolean module option without a description
  mkBoolOpt' = mkOpt' types.bool;

  # -- shorthands for enabling and disabling options
  enabled = {enable = true;};
  disabled = {enable = false;};

  # -- recursively map a directory to path
  getDir = dir:
    mapAttrs
    (file: type:
      if type == "directory"
      then getDir (dir + "/${file}")
      else type)
    (builtins.readDir dir);

  # -- every file in a directory as relative paths
  files = dir: collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));

  # -- every .nix file in a directory as absolute paths
  validFiles = dir:
    map (file: dir + "/${file}")
    (filter
      (file:
        hasSuffix ".nix" file
        && file != "default.nix"
        && ! hasPrefix "x/taffybar/" file
        && ! hasSuffix "-hm.nix" file)
      (files dir));

  # -- fetch an image by URL (TODO: setup some wallpapers)
  fetchImage = url: sha256: let
    ext = last (splitString "." url);
  in
    builtins.fetchurl {
      name = "wallpaper-${sha256}.${ext}";
      inherit url sha256;
    };
}
