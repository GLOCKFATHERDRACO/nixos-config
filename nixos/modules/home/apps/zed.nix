{pkgs, ...}: let
  zedSettings = builtins.fromJSON (builtins.readFile ../../../dots/config/zed/settings.jsonc);
  font = "JetBrainsMono Nerd Font";
in {
  programs.zed-editor = {
    enable = true;
    defaultEditor = true;

    # -- extensions
    extensions = [
      "d2"
      "nix"
      "lua"
      "toml"
    ];

    # -- language servers
    extraPackages = with pkgs; [
      nixd
      clang-tools
      biome
      rust-analyzer
    ];

    userSettings =
      zedSettings
      // {
        buffer_font_family = font;
      };
  };
}
