#!/usr/bin/env bash
# Symlink dotfiles into $HOME / ~/.config and install packages.
# Usage: ./bootstrap.sh [--no-packages]
set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="${XDG_CONFIG_HOME:-$HOME/.config}"

link() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "backup: $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "link:   $dst"
}

link "$REPO/zsh/zshrc"       "$HOME/.zshrc"
link "$REPO/zsh/exports.zsh" "$CONF/zsh/exports.zsh"
link "$REPO/zsh/prompt.zsh"  "$CONF/zsh/prompt.zsh"
link "$REPO/zsh/aliases.zsh" "$CONF/zsh/aliases.zsh"
link "$REPO/git/gitconfig"   "$HOME/.gitconfig"
link "$REPO/git/ignore"      "$CONF/git/ignore"
link "$REPO/psql/psqlrc"      "$HOME/.psqlrc"
link "$REPO/tmux/tmux.conf"  "$HOME/.tmux.conf"
link "$REPO/nvim/init.lua"   "$CONF/nvim/init.lua"

if [[ "${1:-}" != "--no-packages" ]]; then
  if command -v apt-get >/dev/null; then
    grep -vE '^\s*(#|$)' "$REPO/packages.txt" | xargs sudo apt-get install -y
  elif command -v brew >/dev/null; then
    grep -vE '^\s*(#|$)' "$REPO/packages.txt" | xargs brew install
  else
    echo "no supported package manager found, skipping packages"
  fi
fi

echo "done. put your identity in ~/.gitconfig.local"
