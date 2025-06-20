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
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
	font = "Iosevka:size=13";
	font-size-adjustment = "1.0";
	dpi-aware = "no";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = "0.95";
        foreground = "b5b8b7";
        background = "283a37";
        regular0 = "283a37";
        regular1 = "ff8b5f";
        regular2 = "5ec04d";
        regular3 = "b0b01a";
        regular4 = "39bace";
        regular5 = "e99399";
        regular6 = "36c08e";
        regular7 = "99afae";
        bright0 = "2a453d";
        bright1 = "e19e00";
        bright2 = "73be0d";
        bright3 = "c6a843";
        bright4 = "70afef";
        bright5 = "d095e2";
        bright6 = "3cbfaf";
        bright7 = "b5b8b7";
        # selection-foreground = 99afae
        # selection-background = 2a453d
      };
    };
  };
}
