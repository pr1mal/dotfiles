#!/usr/bin/env bash
# Link these dotfiles into $HOME with GNU Stow:
#   common/          on every machine
#   macos/ | linux/  only on that OS
#
# Safe to re-run (after adding files, or after a pull that moved files).
# Real files that would be replaced are moved to ~/.dotfiles-backup/<time>/.
#
# Usage: ./install.sh [--packages]
#   --packages  also install tools from packages/apt.txt (Linux, needs sudo)
#               or packages/Brewfile (macOS)
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
case "$(uname -s)" in
    Darwin) os=macos ;;
    Linux) os=linux ;;
    *) echo "Unsupported OS: $(uname -s)" >&2; exit 1 ;;
esac
packages=(common "$os")

say() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }

# ---- optional: tools ------------------------------------------------------
if [[ ${1:-} == --packages ]]; then
    if [[ $os == linux ]]; then
        say "Installing packages from packages/apt.txt (sudo)"
        sudo apt install -y $(grep -v '^#' "$repo/packages/apt.txt")
    elif [[ -f $repo/packages/Brewfile ]]; then
        say "Installing packages from packages/Brewfile"
        brew bundle --file="$repo/packages/Brewfile"
    fi
fi

if ! command -v stow >/dev/null; then
    echo "GNU Stow is missing; install it first:" >&2
    if [[ $os == macos ]]; then echo "  brew install stow" >&2; else echo "  sudo apt install stow" >&2; fi
    exit 1
fi

# ---- 1. drop broken links into this repo ----------------------------------
# Leftovers from the old layout (e.g. ~/.zshrc -> dotfiles/zshrc) or from
# files that have since moved inside the repo.
say "Removing broken links that point into the repo"
for spec in "$HOME:1" "$HOME/.config:4" "$HOME/.oh-my-zsh/custom:3"; do
    root=${spec%:*} depth=${spec##*:}
    [[ -d $root ]] || continue
    find "$root" -maxdepth "$depth" -type l ! -exec test -e {} \; -print 2>/dev/null |
        while IFS= read -r link; do
            case "$(readlink "$link")" in
                *dotfiles*) echo "    removed $link -> $(readlink "$link")"; rm "$link" ;;
            esac
        done
done

# ---- 2. move real files out of the way -------------------------------------
backup="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
say "Backing up real files that would be replaced (to $backup)"
for pkg in "${packages[@]}"; do
    (cd "$repo/$pkg" && find . -type f ! -name .DS_Store ! -name .gitignore) |
        while IFS= read -r rel; do
            rel=${rel#./}
            target="$HOME/$rel"
            [[ -e $target && ! -L $target ]] || continue
            # Already inside the repo through a linked parent directory?
            parent="$(cd "$(dirname "$target")" && pwd -P)"
            [[ $parent == "$repo"/* ]] && continue
            mkdir -p "$backup/$(dirname "$rel")"
            mv "$target" "$backup/$rel"
            echo "    ~/$rel"
            # Drop directories this emptied, so stow can link the whole
            # directory and new files created there land in the repo.
            dir=$(dirname "$target")
            while [[ $dir != "$HOME" && $dir != "$HOME/.config" ]] && rmdir "$dir" 2>/dev/null; do
                dir=$(dirname "$dir")
            done
        done
done
rmdir "$backup" 2>/dev/null || true

# ---- 3. link ----------------------------------------------------------------
say "Linking: ${packages[*]}"
stow --dir="$repo" --target="$HOME" --restow "${packages[@]}"

# ---- 4. this machine's own settings -----------------------------------------
if [[ ! -e $HOME/.zshrc.local ]]; then
    cp "$repo/zshrc.local.example" "$HOME/.zshrc.local"
    say "Created ~/.zshrc.local from zshrc.local.example; put this machine's settings there"
fi

# ---- 5. tmux plugin manager -------------------------------------------------
tpm="$HOME/.config/tmux/plugins/tpm"
if [[ ! -d $tpm ]]; then
    say "Installing tmux plugin manager (then press prefix + I in tmux)"
    git clone --depth 1 https://github.com/tmux-plugins/tpm "$tpm"
fi

say "Done ($os). Open a new terminal to pick up the shell changes."
