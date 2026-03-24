#!/bin/bash
# Dotfiles installer - symlinks configs to the right locations

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config
echo "  Ghostty config linked"

# Fish
mkdir -p ~/.config/fish
ln -sf "$DOTFILES_DIR/fish/config.fish" ~/.config/fish/config.fish
echo "  Fish config linked"

# Starship
ln -sf "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml
echo "  Starship config linked"

echo ""
echo "Done! Dependencies to install:"
echo "  brew install fish starship bat eza fd ripgrep btop zoxide jq tldr delta lazygit"
echo ""
echo "Add fish to allowed shells:"
echo "  echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells"
echo ""
echo "Set fish as default shell (optional):"
echo "  chsh -s /opt/homebrew/bin/fish"
