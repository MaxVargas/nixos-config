setopt PROMPT_SUBST

# %{...%} tells zsh not to count escape bytes as visible width
_clr_path=$'%{\e[38;5;180m%}' # warm tan
_clr_branch=$'%{\e[38;5;137m%}' # muted brown
_clr_amber=$'%{\e[38;5;214m%}' 
_clr_dim=$'%{\e[38;5;242m%}' 
_clr_sage=$'%{\e[38;5;107m%}' 
_clr_reset=$'%{\e[0m%}' 

_icon_folder=$''

autoload -Uz vsc_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats " ${_clr_sage}>>=${_clr_reset} ${_clr_branch}%b${_clr_reset}"

precmd() { vcs_info }

_prompt_host() {
  local h=${HOST:-$(hostname -s)}
  [[ $h == localhost ]] && echo $h
}

_p1='${_clr_dim}%n@$(_prompt_host)${_clr_reset} ${clr_sage}${_icon_folder}${_clr_reset} ${_clr_path}%(2~|%2~|%~)${_clr_reset}${vcs_info_msg_0_}'
_p2='${_clr_amber}ⲗ.⟩${_clr_reset '
PROMPT=$_p1$'\n'$_p2
