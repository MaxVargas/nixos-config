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
        background="1a110f";
	foreground="f1dfdb";
	regular0="1a110f";
	regular1="ffb4ab";
	regular2="ffb4a3";
	regular3="dbc58c";
	regular4="ffdad2";
	regular5="ffdad2";
	regular6="e7bdb4";
	regular7="f1dfdb";
	bright0="423734";
	bright1="ffb4ab";
	bright2="ffb4a3";
	bright3="dbc58c";
	bright4="ffdad2";
	bright5="ffdad2";
	bright6="e7bdb4";
	bright7="f1dfdb";
	dim0="45475A";
	dim1="F38BA8";
	dim2="A6E3A1";
	dim3="F9E2AF";
	dim4="89B4FA";
	dim5="F5C2E7";
	dim6="94E2D5";
	dim7="BAC2DE";
	selection-foreground="ffb4a3";
	selection-background="561f12";
	cursor="534340 f1dfdb";
      };
    };
  };
}
