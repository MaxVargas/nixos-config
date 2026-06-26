# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "lemuria"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };


  #############################################################################
  #
  # System
  #
  #############################################################################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hotdog = {
    isNormalUser = true;
    initialPassword = "lol";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" ]; # wheel enables `sudo` for the user
    description = "hotdog";
  };

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;

      # Substituters access cache repos of pre-compiled binaries to save on compile time
      substituters = [
        "https://cache.nixos.org?priority=10"
        #"https://nyx.chaotic.cx"
        "https://nix-community.cachix.org"
        "https://cuda-maintainers.cachix.org"
        "https://yazi.cachix.org"
	"https://noctalia.cachix.org"
      ];

      # trusted-public-keys
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" 
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
	"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];

      builders-use-substitutes = true;
      max-jobs=4;
      cores=4;
    };
  };


  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default
  
      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hellp-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Worth noting that NVIDIA drivers are unfree
      allowUnfree = true;
    };
  };


  #####################################
  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      iosevka
      aporetic
      fantasque-sans-mono
      ibm-plex
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      # nerdfonts
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
      nerd-fonts.fantasque-sans-mono
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [
        "Noto Serif"
	"Noto Color Emoji"
        "Aporetic Serif Mono"
      ];
      sansSerif = [
        "Noto Sans"
	"Noto Color Emoji"
	"FantasqueSansM Nerd Font"
      ];
      monospace = [
	"IosevkaTerm Slab Nerd Font"
      ];
      emoji = [ "Noto Color Emoji" "Material Design Icons" ];
    };
    fontconfig.antialias = true;
  };
  # End Fonts
  #####################################

  #####################################
  # Gaming
  # Couple programs we want from the beginning
  # Apparently steam is easiest from configuration.nix
  # Steam hardware for VR stuff
  # Watch Vimjoyer's video
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    # extest.enable = true; # Wayland compatibility
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          liberation_ttf
        ];
    };
  };
  hardware.steam-hardware.enable = true;
  programs.gamemode.enable = true;
  # End Gaming
  #####################################

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    sysstat
    lm_sensors
    yazi
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  #############################################################################
  #
  # Services
  #
  #############################################################################

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Enable the windowing system.
  # xserver is a blanket term for GUI stuff. 
  services.xserver.enable = false;

  # TTY auto-login
  services.getty.autologinUser = "hotdog";

  # Enable NVIDIA and gaming drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true; # if wayland is buggy
  hardware.nvidia.open = true;
  hardware.graphics.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  #####################################
  # Window manager

  environment.sessionVariables = {
    # If your cursor becomes invisible
    # WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    # LIBSEAT_BACKEND = "logind";
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      common = {
        default = [
          "wlr"
        ];
      };
    };
    extraPortals = [ 
      pkgs.xdg-desktop-portal-wlr
    ];
  };

  # End WM
  #####################################

  # Enable sound.
  #hardware.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # For using JACK applications
    jack.enable = true;
  };

  # Continue debugging to set up RMPC...
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.hotdog.uid}"; # User-id must match MPD user. MPD will look inside this directory for the PipeWire socket.
  };

  #############################################################################
  #
  # DONT TOUCH :)
  #
  #############################################################################
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
