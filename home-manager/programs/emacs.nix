{ config, pkgs, ...}:
{
  programs.doom-emacs = {
    enable = true;
    #package = pkgs.emacs;
    #extraConfig = ''
    #  (setq standard-indent 2)
    #'';
  };
}
