{...}: {
  programs.starship = {
    enable = true;
    settings = fromTOML (builtins.readFile ../../../dots/config/starship/starship.toml);
  };
}
