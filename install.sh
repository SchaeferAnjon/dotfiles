#!/bin/bash
# Dotfiles installer
# Usage: git clone <repo> ~/dotfiles && cd ~/dotfiles && ./install.sh

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "=== Dotfiles Installer ==="
echo "Source: $DOTFILES_DIR"
echo ""

# --- 1. Homebrew ---
if ! command -v brew &>/dev/null; then
    echo "[1/4] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "[1/4] Homebrew OK"
fi

# --- 2. Packages ---
echo "[2/4] Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/Brewfile" --no-lock

# --- 3. Symlinks ---
echo "[3/4] Creating symlinks..."

link() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ -e "$dst" ] && [ ! -L "$dst" ]; then
        mv "$dst" "${dst}.bak"
        echo "  backed up $dst"
    fi
    ln -sf "$src" "$dst"
    echo "  $dst -> $src"
}

link "$DOTFILES_DIR/git/gitconfig"          "$HOME/.gitconfig"
link "$DOTFILES_DIR/fish/config.fish"       "$HOME/.config/fish/config.fish"
link "$DOTFILES_DIR/ghostty/config"         "$HOME/.config/ghostty/config"
link "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

# --- 4. Fish as default shell ---
echo "[4/4] Setting Fish as default shell..."
FISH_PATH="/opt/homebrew/bin/fish"
if ! grep -q "$FISH_PATH" /etc/shells 2>/dev/null; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi
if [ "$SHELL" != "$FISH_PATH" ]; then
    chsh -s "$FISH_PATH"
fi

echo ""
echo "Done! Restart your terminal to see changes."
