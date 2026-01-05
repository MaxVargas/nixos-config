{ pkgs, ... }:
# terminals
let
  font = "IosevkaTerm Nerd Font";
in
{
  programs.kitty = {
    enable = true;
  };
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
	font = "Iosevka:size=11";
	font-size-adjustment = "1.0";
	dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        background="1a110f";
	foreground="f1dfdb";
	regular0="1a110f";
	regular1="e5867b";
	regular2="ff9271";
	regular3="dbc58c";
	regular4="ffd685";
	regular5="e8a7ff";
	regular6="e7bdb4";
	regular7="f1dfdb";
	bright0="423734";
	bright1="ffb4ab";
	bright2="ffb4a3";
	bright3="dddd99";
	bright4="ffebc4";
	bright5="f3d3ff";
	bright6="ead9d5";
	bright7="e6e6e6";
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
