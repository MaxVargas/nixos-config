{ pkgs, ... }:
# terminals
let
  font = "IosevkaTerm Nerd Font";
in
{
  programs.kitty = {
    enable = true;
  };
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
	font = "Iosevka:size=11";
	font-size-adjustment = "1.0";
	dpi-aware = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors-dark = {
        background="1a110f";
	foreground="f1dfdb";
	regular0="1a110f";
	regular1="e5867b";
	regular2="ff9271";
	regular3="dbc58c";
	regular4="ffd685";
	regular5="e8a7ff";
	regular6="e7bdb4";
	regular7="f1dfdb";
	bright0="423734";
	bright1="ffb4ab";
	bright2="ffb4a3";
	bright3="dddd99";
	bright4="ffebc4";
	bright5="f3d3ff";
	bright6="ead9d5";
	bright7="e6e6e6";
	dim0="45475A";
	dim1="F38BA8";
	dim2="A6E3A1";
	dim3="F9E2AF";
	dim4="89B4FA";
	dim5="F5C2E7";
	dim6="94E2D5";
	dim7="BAC2DE";
	selection-foreground="ffb4a3";
	selection-background="561f12";
	cursor="534340 f1dfdb";
      };
    };
  };
  programs.bash = {
    enable = true;
    enableCompletion = false;
    initExtra = ''
    # ============================================================
    # History
    # ============================================================
    
    HISTFILE="$HOME/.bash_history"
    HISTSIZE=10000
    HISTFILESIZE=10000
    
    # Ignore duplicates and commands starting with a space
    HISTCONTROL=ignoreboth:erasedups
    
    # Append instead of overwriting
    shopt -s histappend
    
    # ============================================================
    # Colors
    # ============================================================
    
    _clr_path="\[\e[38;5;180m\]"      # warm tan
    _clr_branch="\[\e[38;5;137m\]"    # muted brown
    _clr_amber="\[\e[38;5;229m\]"     # amber
    _clr_dim="\[\e[38;5;242m\]"       # dim gray
    _clr_sage="\[\e[38;5;107m\]"      # sage green
    _clr_reset="\[\e[0m\]"
    
    # Nerd Font icons
    _icon_folder="󰉋"
    _icon_branch=""
    
    
    # ============================================================
    # Git branch
    # ============================================================
    
    #_git_branch() {
    #    git symbolic-ref --short HEAD 2>/dev/null \
    #        || git rev-parse --short HEAD 2>/dev/null
    #}
    
    _prompt_host() {
        local h
        h=$(hostname -s)
    
        if [[ "$h" == "localhost" ]]; then
            echo "lemuria"
        else
            echo "$h"
        fi
    }
    
    
    # Shorten path to last two components (similar to zsh %2~)
    _short_pwd() {
        pwd | awk -F/ '{
            if (NF <= 3)
                print $0
            else
                print ".../" $(NF-1) "/" $NF
        }'
    }
    
    
    # ============================================================
    # Prompt
    # ============================================================
    
    __prompt_command() {
        # local branch="$(_git_branch)"
    
        PS1="''${_clr_dim}\u@$(_prompt_host)''${_clr_reset}"
        PS1+=" ''${_clr_amber}·''${_clr_reset} "
        PS1+="''${_clr_path}''${_icon_folder} $(_short_pwd)''${_clr_reset}"
    
        # if [[ -n "$branch" ]]; then
        #     PS1+=" ''${_clr_amber}·''${_clr_reset} "
        #     PS1+="''${_clr_branch}''${_icon_branch} ''${branch}''${_clr_reset}"
        # fi
    
        PS1+=" \n''${_clr_sage}𝛇❯''${_clr_reset} "
    }
    
    PROMPT_COMMAND="__prompt_command"
    
    
    # ============================================================
    # Bash completion
    # ============================================================
    
    # kill git completion entirely
    if declare -F __git_complete >/dev/null; then
      unset -f __git_complete __gitcomp _git
    fi

    complete -r git 2>/dev/null

    if [[ -r /etc/bash_completion ]]; then
        source /etc/bash_completion
    fi
    '';
  };
}
