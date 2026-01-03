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
          showCapsule = false;
	  useSeparateOpacity = false;
	  #backgroundOpacity = 0.01;
	  floating = false;
	  outerCorners = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
	      {
	        id = "Taskbar";
	      }
	      {
	        id = "Volume";
	      }
	      {
	        id = "MediaMini";
		showArtistFirst = false;
		showProgressRing = true;
	      }
            ];
            center = [
              {
                hideUnoccupied = true;
                id = "Workspace";
                labelMode = "index";
              }
            ];
            right = [
	      {
	        id = "SystemMonitor";
		compactMode = false;
		usePrimaryColor = true;
		useMonospaceFont = true;
		showCpuUsage = true;
		showCpuTemperature = true;
		showMemoryUsage = true;
		showMemoryAsPercent = true;
		showNetworkStats = true;
	      }
	      {
	        id = "VPN";
	      }
              {
                formatHorizontal = "MMM dd, HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Everdeer";
        location = {
          monthBeforeDay = true;
          name = "Portland, Oregon, USA";
	  weatherEnabled = true;
	  weatherShowEffects = true;
	  useFahrenheit = true;
	  use12hourFormat = false;
	  showWeekNumberInCalendar = true;
	  showCalendarEvents = false;
	  showCalendarWeather = true;
	  analogClockInCalendar = true;
	  firstDayOfWeek = -1;
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
	controlCenter = {
          position = "close_to_bar_button";
	  shortcuts = {
	    left = [
	      {
	        id = "DarkMode";
	      }
	      {
	        id = "ScreenRecorder";
	      }
	      {
	        id = "WallpaperSelector";
	      }
	    ];
	    right = [
	      {
	        id = "Notifications";
	      }
	      {
	        id = "KeepAwake";
	      }
	      {
	        id = "NightLight";
	      }
	    ];
	  };
	  osd = {
	    enabled = true;
	    location = "top_right";
	    autoHideMs = 2000;
	    overlayLayer = true;
	    backgroundOpacity = 1;
	    enabledTypes = [
	      0 1 4
	    ];
	    monitors = [ "HDMI-A-1" ];
	  };
	  cards = [
	    {
	      id = "profile-card";
	      enabled = true;
	    }
	    {
	      id = "shortcuts-card";
	      enabled = true;
	    }
	    {
	      id = "audio-card";
	      enabled = false;
	    }
	    {
	      id = "brightness-card";
	      enabled = false;
	    }
	    {
	      id = "weather-card";
	      enabled = false;
	    }
	    {
	      id = "media-sysmon-card";
	      enabled = true;
	    }
	  ];
	};
	sessionMenu = {
          enableCountdown = true;
          countdownDuration = 10000;
          position = "center";
          showHeader = true;
          largeButtonsStyle = false;
          showNumberLabels = true;
          powerOptions = [
            {
              action = "lock";
              enabled = true;
            }
            {
              action = "suspend";
              enabled = true;
            }
            {
              action = "hibernate";
              enabled = true;
            }
            {
              action = "reboot";
              enabled = true;
            }
            {
              action = "logout";
              enabled = true;
            }
            {
              action = "shutdown";
              enabled = true;
            }
          ];
        };
        audio = {
          volumeStep = 5;
          volumeOverdrive = false;
          cavaFrameRate = 30;
          visualizerType = "linear";
          mprisBlacklist = [ ];
          preferredPlayer = "";
          externalMixer = "pwvucontrol || pavucontrol";
        };
	systemMonitor = {
          cpuWarningThreshold = 80;
          cpuCriticalThreshold = 90;
          tempWarningThreshold = 80;
          tempCriticalThreshold = 90;
          gpuWarningThreshold = 80;
          gpuCriticalThreshold = 90;
          memWarningThreshold = 80;
          memCriticalThreshold = 90;
          diskWarningThreshold = 80;
          diskCriticalThreshold = 90;
          cpuPollingInterval = 3000;
          tempPollingInterval = 3000;
          gpuPollingInterval = 3000;
          enableDgpuMonitoring = false;
          memPollingInterval = 3000;
          diskPollingInterval = 3000;
          networkPollingInterval = 3000;
          useCustomColors = false;
          warningColor = "";
          criticalColor = "";
          diskPath = "/";
        };
	notifications = {
          enabled = true;
          monitors = [ ];
          location = "top_right";
          overlayLayer = true;
          backgroundOpacity = 1;
          respectExpireTimeout = false;
          lowUrgencyDuration = 3;
          normalUrgencyDuration = 8;
          criticalUrgencyDuration = 15;
          enableKeyboardLayoutToast = true;
          saveToHistory = {
            low = true;
            normal = true;
            critical = true;
          };
	  sounds = {
            enabled = false;
            volume = 0.5;
            separateSounds = false;
            criticalSoundFile = "";
            normalSoundFile = "";
            lowSoundFile = "";
            excludedApps = "discord,firefox";
          };
        };
	dock = {
	  enabled = false;
	};
	network = {
	  wifiEnabled = false;
	  bluetoothEnabled = false;
	};
	desktopWidgets = {
	  enabled = false;
	};
	hooks = {
	  enabled = false;
        };
        nightLight = {
	  enabled = false;
	};
      };
    };
  };
}

