{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    fd
    symbola
  ];
  programs.emacs = {
    enable = true;
  };
}
