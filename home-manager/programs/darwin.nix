{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # utils
    ripgrep
    yq-go
    fzf
    gh

    # misc
    file
    which
    tree
    gnupg
    graphviz
    tree-sitter

    # productivity
    presenterm # presentations
    glow
    emacs

    # programming
    gnumake
    cmake
    gcc
    rustup
    uv
    nodejs
    go
    jdk21
    mono
    docker-compose
    ghc
    haskell-language-server
    cabal-install
    sbcl
    nixfmt

    # database
    mongosh
    mongodb-atlas-cli

    # monitoring
    lsof

    # misc
    fastfetch
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    yazi = {
      enable = true;
      settings = {
        tasks = {
	      image_bound=[0 0];
	      };
      };
    };

    bat = {
      enable = true;
      config = { pager = "less -FR"; };
    };

    btop.enable = true; 
    eza.enable = true; 
    jq.enable = true; 
  };
}
