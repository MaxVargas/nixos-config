{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    fd
    symbola
    aspell # spell checker
    emacsPackages.eglot
    emacsPackages.consult-eglot
    emacsPackages.flycheck-eglot
  ];
  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
  };

  xdg.configFile."doom".source = ./config/doom;
}
