# Dotfiles

My terminal setup: **Ghostty + Fish + Starship** with **Catppuccin Mocha** theme.

## What's included

| Tool | Purpose | Config |
|------|---------|--------|
| [Ghostty](https://ghostty.org) | Terminal emulator | `ghostty/config` |
| [Fish](https://fishshell.com) | Shell | `fish/config.fish` |
| [Starship](https://starship.rs) | Prompt | `starship/starship.toml` |

## CLI Tools

- `bat` - better `cat`
- `eza` - better `ls`
- `fd` - better `find`
- `ripgrep` - better `grep`
- `btop` - better `top`
- `zoxide` - smarter `cd`
- `delta` - better `diff`
- `lazygit` - git TUI
- `jq` - JSON processor
- `tldr` - simplified man pages

## Install

```bash
# Install dependencies
brew install ghostty fish starship bat eza fd ripgrep btop zoxide jq tldr delta lazygit

# Add fish to allowed shells
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells

# Clone and link configs
git clone https://github.com/$(gh api user -q .login)/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Font

Uses [Maple Mono NF CN](https://github.com/subframe7536/maple-font) - a Nerd Font with CJK support.
