{
  lib,
  pkgs,
  ...
}: {
  programs = {
    noctalia-shell = {
      enable = true;
      
      settings = {
        settingsVersion = 0;
        # configure noctalia here
        general = {
          avatarImage = "";
          dimmerOpacity = 0.05;
          showScreenCorners = false;
          forceBlackScreenCorners = false;
          scaleRatio = 1;
          radiusRatio = 0.75;
          iRadiusRatio = 0;
          boxRadiusRatio = 0;
          screenRadiusRatio = 1;
          animationSpeed = 2;
          animationDisabled = false;
          compactLockScreen = false;
          lockOnSuspend = true;
          showSessionButtonsOnLockScreen = true;
          showHibernateOnLockScreen = false;
          enableShadows = false;
	  language="en";
          allowPanelsOnScreenWithoutBar = true;
        };
        bar = {
          position = "top";
	  monitors = [ "DP-1" "HDMI-A-1" ];
          density = "compact";
	  showOutline = false;
          showCapsule = true;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "WiFi";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
        location = {
          monthBeforeDay = true;
          name = "Marseille, France";
        };
	wallpaper = {
	  enabled = true;
	  overviewEnabled = false;
          directory = "/etc/nixos/home-manager/shell/wallpapers";
	  monitorDirectories = [
	    {
	      name = "DP-1";
	      directory = "/etc/nixos/home-manager/shell/wallpapers/dp";
	    }
            {
	      name = "HDMI-A-1";
	      directory = "/etc/nixos/home-manager/shell/wallpapers/hdmi";
	    }
	  ];
	  enableMultiMonitorDirectories = true;
	  recursiveSearch = false;
	  setWallpaperOnAllMonitors = true;

	  randomEnabled = true;
	  transitionDuration = 500;
	  transitionType = "random";
	  transitionEdgeSmoothness = "0.05";
	  randomIntervalSec = 10800;

	  panelPosition = "center";
	  hideWallpaperFilenames = false;
	  useWallhaven = false;
	};
	ui = {
	  fontDefault = "IosevkaTerm Nerd Font Mono";
          fontFixed = "IosevkaTerm Nerd Font Mono";
	  fontDefaultScale = 1.03;
	  fontFixedScale = 1.03;
	  tooltipsEnabled = true;
	  panelBackgroundOpacity = 0.93;
	  panelsAttachedToBar = false;
	  settingsPanelMode = "centered";
	  #wifiDetailsViewMode = "grid";
	  #bluetoothDetailsViewMode = "grid";
	  #bluetoothHideUnnamedDevices = false;
	};
      };
      # this may also be a string or a path to a JSON file,
      # but in this case must include *all* settings.
    };
  };
}

