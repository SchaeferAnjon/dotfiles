# Fish Shell Configuration
# Theme: Catppuccin Mocha + Starship Prompt

# --- Homebrew ---
fish_add_path /opt/homebrew/bin

# --- Starship Prompt ---
starship init fish | source

# --- Zoxide (smart cd) ---
zoxide init fish | source

# --- Aliases ---
# Modern replacements
alias ls "eza --icons --group-directories-first"
alias ll "eza -la --icons --group-directories-first"
alias lt "eza --tree --icons --level=2"
alias cat "bat --paging=never"
alias grep "rg"
alias find "fd"
alias top "btop"
alias diff "delta"

# Git shortcuts
alias g "git"
alias gs "git status"
alias ga "git add"
alias gc "git commit"
alias gp "git push"
alias gl "git log --oneline --graph --decorate -20"
alias gd "git diff"
alias lg "lazygit"

# Navigation
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

# --- Environment ---
set -gx EDITOR "code"
set -gx LANG "en_US.UTF-8"

# --- Greeting ---
set -g fish_greeting ""
