# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

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

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  #############################################################################
  #
  # System
  #
  #############################################################################

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.max = {
    isNormalUser = true;
    initialPassword = "UnrealPassword";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" ]; # wheel enables ‘sudo’ for the user.
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
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cuda-maintainers.cachix.org"
        "https://yazi.cachix.org"
      ];

      # trusted-public-keys
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" 
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
      ];

      builders-use-substitutes = true;
      max-jobs=2;
      cores=2;
    };

    # Add yourself as a trusted user for devenv
    extraOptions = ''
      trusted-users = root max
    '';

    # Opinionated: disable channels
    # channel.enable = false;
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

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  #####################################
  # Fonts
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-design-icons

      # normal fonts
      iosevka

      # nerdfonts
      nerd-fonts.iosevka-term
      nerd-fonts.iosevka-term-slab
    ];

    # use fonts specified by user rather than default ones
    enableDefaultPackages = false;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
      serif = [
        "IosevkaTerm Slab Nerd Font"
      ];
      sansSerif = [
        "IosevkaTerm Nerd Font" 
      ];
      monospace = [
        "IosevkaTerm Nerd Font" 
	"IosevkaTerm Slab Nerd Font"
	"Iosevka Etoile"
      ];
      emoji = ["Material Design Icons"];
    };
  };
  # End Fonts
  #####################################

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

  # Waydroid for android simulation
  # virtualisation.waydroid.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    seatd # seat management daemon. needed for hyprland?
    # elogind # login daemon
    sysstat # monitoring
    lm_sensors # monitoring
    scrot # screenshots
    yazi # terminal file manager
    #waybar
    #waybar.overrideAttrs (oldAttrs: {
    #  mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
    #}))
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
  ## services.xserver.enable = true;
  services.xserver.enable = false;

  # Enable the GNOME Desktop Environment.
  # GNOME uses wayland as default.
  ##services.xserver.displayManager.gdm.enable = true;
  ##services.xserver.desktopManager.gnome.enable = true;

  # TTY auto-login
  services.getty.autologinUser = "max";

  # Enable NVIDIA and gaming drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.modesetting.enable = true; # if wayland is buggy
  hardware.nvidia.open = true;
  hardware.graphics.enable = true;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.beta;

  #####################################
  # Window manager. Wayland
  # See ../home-manager/programs/desktop.nix
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.dconf.enable = true; # hyprland
  security.polkit.enable = true; # needed according to the NixOS hyprland page

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

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ 
    pkgs.xdg-desktop-portal-wlr
    pkgs.xdg-desktop-portal-hyprland 
    pkgs.xdg-desktop-portal-gtk
  ];

  # End Wayland
  #####################################

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

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
  services.mpd.user = "max";
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.max.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
  };
  services.mpd.extraConfig = ''
    audio_output {
      type "pipewire"
      name "Pipewire!" # This can be whatever you want
    }
  '';

  #############################################################################
  #
  # DONT TOUCH :)
  #
  #############################################################################

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

