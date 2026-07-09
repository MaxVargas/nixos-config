
{pkgs, ...}@inputs: {
  ###############################################################################
  #
  # All of hotdog's home manager configuration
  #
  ###############################################################################

  imports = [
    ../../home-manager/core.nix

    ../../home-manager/programs/darwin.nix
    ../../home-manager/shell/darwin.nix
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

  home.file.".config/nvim".source=../hotdog/nvim;
}
