# ybrannagh-dotfiles

My shell, editor and git config.

## Install

```sh
git clone <this repo> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

## What is in here

| Path | What it does |
|---|---|
| `bootstrap.sh` | Symlinks files into `$HOME` and `~/.config`, installs `packages.txt` |
| `packages.txt` | Plain-text package list (apt or brew names) |
| `zsh/zshrc` | History, completion, sources the other zsh files |
| `zsh/prompt.zsh` | Two-line prompt with git branch |
| `zsh/aliases.zsh` | Navigation and git aliases |
| `git/gitconfig` | Git defaults. Identity is a placeholder, see below |
| `git/ignore` | Global gitignore |
| `tmux/tmux.conf` | tmux config, prefix is `C-a` |
| `nvim/init.lua` | Minimal neovim config |

## Git identity

`git/gitconfig` includes `~/.gitconfig.local`. Put your real `[user]` block there:

```ini
[user]
    name = Your Name
    email = you@example.invalid
```

Owner: Yuki Brannagh. Last reviewed: 2026-04-02
