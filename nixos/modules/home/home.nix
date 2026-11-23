{
  pkgs,
  stateVersion,
  packages,
  ...
}: {
  home = {
    inherit stateVersion;
    packages = packages pkgs;
  };
}
