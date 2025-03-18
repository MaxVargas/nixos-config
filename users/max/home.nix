{pkgs, ...}: {
  ###############################################################################
  #
  # All of max's home manager configuration
  #
  ###############################################################################

  imports = [
    ../../home-manager/core.nix

    ../../home-manager/programs
    ../../home-manager/shell
  ];

  programs.git = {
    userName = "MaxVargas";
    userEmail = "mxvrgs@gmail.com";
    enable = true;
  };
}
