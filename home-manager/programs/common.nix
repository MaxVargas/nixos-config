{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    yq-go # yaml processor https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    # misc
    cowsay
    file
    which
    tree
    tree-sitter
    stylua
    lua-language-server
    #gnused
    #gnutar
    #gawk
    #zstd
    #gnupg
    libnotify # sends notifications to the daemon
    dunst # the notification daemon (alternate mako)
    graphviz
    xdg-utils
    swww # wallpaper daemon (alts. hyprpaper swaybg wpaperd mpvpaper)
    eww # status bar
    rofi-wayland # app launcher for wayland
    swayimg # image viewer
    imv # another image viewer
   
    # productivity
    obsidian
    hugo # static site generator
    glow # markdown previewer in terminal
    zathura # pdf reader. maybe okular?

    # audio control
    pavucontrol

    # cloud native
    #docker-compose
    #kubectl

    # db related
    #dbeaver-bin
    #mycli
    #pgcli

    iotop # io monitoring
    iftop # network monitoring
    killport

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses
    networkmanagerapplet # network manager

    # programming
    gnumake
    cmake
    gcc
    libgcc
    rustup
    python313
    uv
    elan
    nodejs
    nodePackages.npm
    nodePackages.pnpm
    yarn
    ghc
    haskell-language-server
    cabal-install
    haskellPackages.tidal
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      keyMode = "vi";
      extraConfig = "mouse on";
    };

    neovim = {
      enable = true;
      vimAlias = true;
    };

    # a cat clone written in rust
    bat = {
      enable = true;
      config = { pager = "less -FR"; };
    };

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    ssh.enable = true;
    #aria2.enable = true;

    skim = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "rg --files --hidden";
      changeDirWidgetOptions = [
        "--preview 'exa --icons --git --color always -T -L 3 {} | head -200"
        "--exact"
      ];
    };
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;
  };
}
