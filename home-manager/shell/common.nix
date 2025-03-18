{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alejandra
    deadnix
    statix
    devenv
    direnv
  ];
}
