{ pkgs, ... }: {
  imports = [
    ./common.nix
  ];

  home.packages = with pkgs; [
    zsh-autosuggestions
  ];

  programs.zsh = {
    enable = true;

    history = {
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      share = false;
    };

    shellAliases = {
      vim = "nvim";
      buyan-rebuild = "sudo darwin-rebuild switch --flake ~/.config/nix#buyan";
      buyan-home = "home-manager switch --flake ~/.config/nix#buyan";
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    initExtra = ''
      # HOMEbrew
      eval "$(/opt/homebrew/bin/brew shellenv)"

      # -- Prompt -----------------------------
      source ${./zsh-prompt.zsh}

      # -- Autosuggesions; default off, toggle with Ctrl+\ -----
      source
      ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh

      _toggle_autosuggestions() {
        if [[ $_ZSH_AUTOSUGGEST_DISABLED == 1 ]]; then
          _zsh_autosuggest_enable
          _ZSH_AUTOSUGGEST_DISABLED=0
        else
          _zsh_autosuggest_disable
          _ZSH_AUTOSUGGEST_DISABLED=1
        fi
      }
      zle -N _toggle_autosuggestions
      bindkey '^\' _toggle_autosuggestions
      _zsh_autosuggest_disable
      _ZSH_AUTOSUGGEST_DISABLED=1
    '';
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = true;
  };
}


