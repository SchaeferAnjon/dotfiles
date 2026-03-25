# Fish Shell Configuration
# Theme: Catppuccin Mocha + Starship Prompt

# --- PATH ---
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.orbstack/bin
fish_add_path $HOME/npm-global/bin

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

# File manager
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (command cat -- $tmp); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- $cwd
    end
    rm -f -- $tmp
end

# Navigation
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."

# --- Environment ---
set -gx EDITOR "code"
set -gx LANG "en_US.UTF-8"

# --- Greeting ---
set -g fish_greeting ""

# --- Conda / Mamba ---
if test -f $HOME/miniforge3/etc/fish/conf.d/conda.fish
    source $HOME/miniforge3/etc/fish/conf.d/conda.fish
end
if test -f $HOME/miniforge3/etc/fish/conf.d/mamba.fish
    source $HOME/miniforge3/etc/fish/conf.d/mamba.fish
end

# --- mise (runtime version manager) ---
if test -f $HOME/.local/bin/mise
    $HOME/.local/bin/mise activate fish | source
end
