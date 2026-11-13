# dotfiles

Shared between a Mac and a Linux (Ubuntu/GNOME) machine. Configuration
comes in three layers:

| Layer | Where | Used on |
|---|---|---|
| Shared | `common/` | every machine |
| OS | `macos/`, `linux/` | only that OS |
| Machine | `~/.zshrc.local` (not in git) | only that machine: work settings, secrets |

Each folder mirrors `$HOME`. [GNU Stow](https://www.gnu.org/software/stow/)
links `common/` plus the folder for the current OS into `$HOME`, so the files
you edit (`~/.zshrc`, `~/.config/nvim/...`) are the files in this repo.

## Setup

```sh
git clone https://github.com/pr1mal/dotfiles.git
cd dotfiles
./install.sh              # or ./install.sh --packages to install tools first
```

`install.sh` is safe to re-run. It removes broken links into the repo (left
behind when files move), moves real files it would replace into
`~/.dotfiles-backup/<time>/`, links everything with stow, creates
`~/.zshrc.local` from `zshrc.local.example` if missing, and installs the tmux
plugin manager.

Day to day: edit files in place, commit, push; on the other machine `git pull`.
Re-run `./install.sh` only after adding or moving files.

## Where OS-specific settings go

Shared files load an OS file from a fixed path, and `macos/` or `linux/`
provides it, so shared files don't need "if Mac" checks:

| Tool | Shared | OS-specific | Machine |
|---|---|---|---|
| zsh | `common/.zshrc`, `.config/zsh/functions.zsh` | `.config/zsh/os.zsh` | `~/.zshrc.local` |
| tmux | `common/.config/tmux/tmux.conf` | `.config/tmux/os.conf` | |

Rule of thumb:

- a whole file used on one OS only → that OS's folder (Karabiner, Phoenix, GNOME hotkeys)
- a block of settings → the tool's OS file
- a one-liner → inline where the language makes it natural
  (`[[ $OSTYPE == darwin* ]]`, `vim.fn.has("mac")`)
- anything machine-specific or secret → `~/.zshrc.local`
