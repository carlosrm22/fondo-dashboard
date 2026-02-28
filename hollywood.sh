# Shell helpers: redirect old hollywood commands to fondo.
# Source this file from ~/.bashrc.d or ~/.zshrc.local.

fondo() {
  command "$HOME/.local/bin/fondo" "$@"
}

fondo_stop() {
  tmux kill-session -t fondo >/dev/null 2>&1 || true
}

fondo_bg() {
  if [[ -z "${DISPLAY:-}" && -z "${WAYLAND_DISPLAY:-}" ]]; then
    fondo "$@"
    return
  fi

  if command -v konsole >/dev/null 2>&1; then
    nohup konsole --fullscreen -e bash -lc 'fondo' >/dev/null 2>&1 &
  elif command -v gnome-terminal >/dev/null 2>&1; then
    nohup gnome-terminal --full-screen -- bash -lc 'fondo' >/dev/null 2>&1 &
  elif command -v xfce4-terminal >/dev/null 2>&1; then
    nohup xfce4-terminal --fullscreen -x bash -lc 'fondo' >/dev/null 2>&1 &
  elif command -v xterm >/dev/null 2>&1; then
    nohup xterm -maximized -e bash -lc 'fondo' >/dev/null 2>&1 &
  else
    echo "No se encontro un emulador de terminal para modo pantalla completa." >&2
    return 127
  fi
}

# Backward compatibility with previous repo commands.
hollywood() {
  fondo "$@"
}

hollywood_classic() {
  FONDO_MOTION=0 FONDO_LAYOUT_INTERVAL=10 fondo "$@"
}

hollywood_bg() {
  fondo_bg "$@"
}

hollywood_bg_classic() {
  FONDO_MOTION=0 FONDO_LAYOUT_INTERVAL=10 fondo_bg "$@"
}

hollywood_stop() {
  fondo_stop
}

alias fondo-stop='fondo_stop'
alias fondo-bg='fondo_bg'
alias hollywood-bg='hollywood_bg'
alias hbg='hollywood_bg'
alias hollywood-classic='hollywood_classic'
alias hclassic='hollywood_classic'
alias hollywood-bg-classic='hollywood_bg_classic'
alias hbgc='hollywood_bg_classic'
alias hollywood-stop='hollywood_stop'
