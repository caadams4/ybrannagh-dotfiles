# mkcd DIR -- make a directory and go into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# loadenv [FILE] -- export the variables from an env file into this shell
loadenv() {
  local f="${1:-$HOME/.config/peltaview.env}"
  [[ -r "$f" ]] || { echo "loadenv: cannot read $f" >&2; return 1; }
  set -a; source "$f"; set +a
}

# pgq 'SELECT ...' -- one-off query, csv output
pgq() { psql --csv -c "$1"; }

# gb -- fuzzy-ish branch switcher without fzf
gb() { git branch --sort=-committerdate | head -15; }
