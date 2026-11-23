{
  config,
  inputs,
  lib,
  pkgs,
  system,
  ...
}: {
  config = lib.mkIf system.roblox {
    home.packages = [
      inputs.mocktail.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    # -- configuration
    xdg.configFile."mocktail".source =
      config.lib.file.mkOutOfStoreSymlink "${system.dotfiles}/nixos/dots/config/mocktail";

    # -- desktop entry
    xdg.dataFile."applications/space.bigrat.mocktail.desktop".source =
      config.lib.file.mkOutOfStoreSymlink "${system.dotfiles}/nixos/dots/entries/space.bigrat.mocktail.desktop";
  };
}
