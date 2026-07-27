{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    fd
    symbola
    aspell # spell checker
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };
}
