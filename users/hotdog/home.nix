{pkgs, ...}@inputs: {
  ###############################################################################
  #
  # All of hotdog's home manager configuration
  #
  ###############################################################################

  imports = [
    ../../home-manager/core.nix

    ../../home-manager/programs
    ../../home-manager/shell
    inputs.mango.hmModules.mango
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "MaxVargas";
      user.email = "mxvrgs@gmail.com";

      init.defaultBranch = "main";
    };
    signing.format = null;
  };

  home.file.".config/nvim".source=./nvim;
}
