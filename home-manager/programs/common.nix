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
    rar

    # utils
    ripgrep # recursively searches directories for a regex pattern
    yq-go # yaml processor https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder
    killall # to kill
    dmidecode
    pdf2svg
    xdg-utils
    gthumb # another image viewer, cropping utility
    swayimg # image viewer
    imagemagick
    cliphist
    wl-clip-persist
    wl-clipboard
    wlr-randr
    grim
    slurp

    # Desktop
    waybar # status bar
    swaybg # wallpaper daemon (alts. hyprpaper swaybg wpaperd mpvpaper)
    rofi # app launcher for wayland
    quickshell
    bibata-cursors

    # misc
    neofetch
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
    gnupg # GNU Privacy Guard
    libnotify # sends notifications to the daemon
    dunst # the notification daemon (alternate mako)
    graphviz
    cdrkit # burn CDs
    fontpreview # view fonts
   
    # productivity
    obsidian
    hugo # static site generator
    glow # markdown previewer in terminal
    zathura # pdf reader. maybe okular?

    # audio control
    pavucontrol
    ffmpeg_7
    yt-dlp
    rmpc # rust music player
    mpd

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
    (python3.withPackages (python-pkgs: [
      python-pkgs.mutagen
    ]))
    uv
    elan
    nodejs
    #nodePackages.npm
    #nodePackages.pnpm
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
      defaultEditor = true;
    };

    yazi = {
      enable = true;
      settings = {
        tasks = {
	  image_bound=[0 0];
	};
      };
    };

    rmpc = {
      enable = true;
      config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
          address: "127.0.0.1:6600",
          password: None,
          theme: None,
          cache_dir: "/home/max/Music",
          on_song_change: None,
          volume_step: 5,
          scrolloff: 0,
          wrap_navigation: false,
          enable_mouse: true,
          status_update_interval_ms: 1000,
          select_current_song_on_change: false,
          album_art: (
              method: Auto,
              max_size_px: (width: 600, height: 600),
          ),
          keybinds: (
              global: {
                  ":":       CommandMode,
                  ",":       VolumeDown,
                  "s":       Stop,
                  ".":       VolumeUp,
                  "c":       ToggleSingle,
                  "<Tab>":   NextTab,
                  "<S-Tab>": PreviousTab,
                  "1":       SwitchToTab("Queue"),
                  "2":       SwitchToTab("Directories"),
                  "3":       SwitchToTab("Artists"),
                  "4":       SwitchToTab("Albums"),
                  "5":       SwitchToTab("Playlists"),
                  "6":       SwitchToTab("Search"),
                  "q":       Quit,
                  "x":       ToggleRandom,
                  ">":       NextTrack,
                  "<":       PreviousTrack,
                  "f":       SeekForward,
                  "v":       ToggleConsume,
                  "p":       TogglePause,
                  "z":       ToggleRepeat,
                  "b":       SeekBack,
                  "~":       ShowHelp,
                  "I":       ShowCurrentSongInfo,
                  "O":       ShowOutputs,
              },
              navigation: {
                  "k":       Up,
                  "j":       Down,
                  "h":       Left,
                  "l":       Right,
                  "<Up>":    Up,
                  "<Down>":  Down,
                  "<Left>":  Left,
                  "<Right>": Right,
                  "<C-k>":   PaneUp,
                  "<C-j>":   PaneDown,
                  "<C-h>":   PaneLeft,
                  "<C-l>":   PaneRight,
                  "<C-u>":   UpHalf,
                  "N":       PreviousResult,
                  "a":       Add,
                  "A":       AddAll,
                  "r":       Rename,
                  "n":       NextResult,
                  "g":       Top,
                  "<Space>": Select,
                  "G":       Bottom,
                  "<CR>":    Confirm,
                  "i":       FocusInput,
                  "J":       MoveDown,
                  "<C-d>":   DownHalf,
                  "/":       EnterSearch,
                  "<C-c>":   Close,
                  "<Esc>":   Close,
                  "K":       MoveUp,
                  "D":       Delete,
              },
              queue: {
                  "D":       DeleteAll,
                  "<CR>":    Play,
                  "<C-s>":   Save,
                  "a":       AddToPlaylist,
                  "d":       Delete,
                  "i":       ShowInfo,
              },
          ),
          search: (
              case_sensitive: false,
              mode: Contains,
              tags: [
                  (value: "any",         label: "Any Tag"),
                  (value: "artist",      label: "Artist"),
                  (value: "album",       label: "Album"),
                  (value: "albumartist", label: "Album Artist"),
                  (value: "title",       label: "Title"),
                  (value: "filename",    label: "Filename"),
                  (value: "genre",       label: "Genre"),
              ],
          ),
          tabs: [
              (
                  name: "Queue",
                  border_type: None,
                  pane: Split(
                      direction: Horizontal,
                      panes: [(size: "40%", pane: Pane(AlbumArt)), (size: "60%", pane: Pane(Queue))],
                  ),
              ),
              (
                  name: "Directories",
                  border_type: None,
                  pane: Pane(Directories),
              ),
              (
                  name: "Artists",
                  border_type: None,
                  pane: Pane(Artists),
              ),
              (
                  name: "Album Artists",
                  border_type: None,
                  pane: Pane(AlbumArtists),
              ),
              (
                  name: "Albums",
                  border_type: None,
                  pane: Pane(Albums),
              ),
              (
                  name: "Playlists",
                  border_type: None,
                  pane: Pane(Playlists),
              ),
              (
                  name: "Search",
                  border_type: None,
                  pane: Pane(Search),
              ),
          ],
      )
      '';
    };

    # a cat clone written in rust
    bat = {
      enable = true;
      config = { pager = "less -FR"; };
    };

    #ssh = {
    #  enable = false;
    #  enableDefaultConfig = false;
    #};

    btop.enable = true; # replacement of htop/nmon
    eza.enable = true; # A modern replacement for ‘ls’
    jq.enable = true; # A lightweight and flexible command-line JSON processor
    #aria2.enable = true;
  };

  services = {
    syncthing.enable = true;

    # auto mount usb drives
    udiskie.enable = true;

    mpd = {
      #user = "max";
      enable = true;
      dataDir = "/home/max/.config/mpd";
      musicDirectory = "/home/max/Music";
      playlistDirectory = "/home/max/Music/playlists";
      network.listenAddress = "$XDG_RUNTIME_DIR/mpd/socket";
      network.startWhenNeeded = true;
      extraConfig = ''
audio_output {
  type "pipewire"
  name "MPD Pipewire" # This can be whatever you want
}
# port = "6600"
# socket = "/run/user/1000/mpd/socket" # Allow mpd to connect to pipewire
     '';
    };
  };
}
