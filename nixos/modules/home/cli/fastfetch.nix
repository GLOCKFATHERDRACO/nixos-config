{
  programs.fastfetch = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ../../../dots/config/fastfetch/config.jsonc);
  };

  programs.fish.interactiveShellInit = "fastfetch";
}
