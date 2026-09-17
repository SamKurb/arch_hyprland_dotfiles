#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\u@\w \$ '

fastfetch

[ -f "/home/samkurb/.ghcup/env" ] && . "/home/samkurb/.ghcup/env" # ghcup-env
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"


alias azahar="org.azahar_emu.Azahar"

# Created by `pipx` on 2026-06-15 20:25:17
export PATH="$PATH:/home/samkurb/.local/bin"

__setKittyPadding() {
  kitten @ set-spacing "padding=$1"
}

__restoreKittyPaddingWithoutFlicker() {
  tput smcup 2>/dev/null   
  __setKittyPadding default
  tput rmcup 2>/dev/null  
}

runWithKittyPadding() {
  local padding="$1" status
  shift

  __setKittyPadding "$padding"
  command "$@"
  status=$?

  __restoreKittyPaddingWithoutFlicker
  return "$status"
}

cmatrix() {
  runWithKittyPadding 0 cmatrix "$@"
}


nvim() {
  runWithKittyPadding 0 nvim "$@"
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias horizon-client="GTK_THEME=Default horizon-client"
