{ config, pkgs, ...}:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
    #defaultEditor = false;
    extraConfig = ''
      (setq standard-indent 2)
    '';
  };
}
