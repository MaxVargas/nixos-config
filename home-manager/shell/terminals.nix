{ pkgs, ... }:

# terminals
# https://github.com/ghostty-org/ghostty/blob/main/src/config/Config.zig

let
  font = "IosevkaTerm Nerd Font";
in
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 11;
      font-family = font;

      unfocused-split-opacity = 0.96;
      window-theme = "dark";

      # Disable ligatures
      font-feature = ["-liga" "-dlig" "-calt"];

      theme = "Chalk";
    };
  };
  programs.kitty = {
    enable = true;
  };
}
