{
  programs.alacritty = {
    enable = true;

    settings = {
      # -- shell settings
      terminal.shell.program = "fish";
      scrolling.history = 10000;
      selection.save_to_clipboard = true;

      # -- window management
      window = {
        opacity = 0.90;
        dimensions = {
          columns = 120;
          lines = 26;
        };
        padding = {
          x = 8;
          y = 8;
        };

        # -- window buttons (full or none)
        decorations = "full";
      };

      # -- cursor
      cursor.style = {
        shape = "Block";
        blinking = "On";
      };

      # -- fonts
      font = {
        size = 10.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
      };
    };
  };
}
