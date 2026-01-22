#!/usr/bin/env bash

set -oue pipefail

# Set zsh as default shell
chsh -s /bin/zsh root
chsh -s /bin/zsh bazzite

# Install oh-my-zsh for default user
runuser -l bazzite -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'

# Configure starship prompt
runuser -l bazzite -c 'mkdir -p ~/.config && echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc'

# Add useful aliases for development
runuser -l bazzite -c 'cat >> ~/.zshrc << "EOF"

# Aliases
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias cat="bat"
alias vim="nvim"

# Docker/Podman
alias dc="docker-compose"
alias dps="docker ps"

# Git shortcuts
alias gs="git status"
alias gp="git pull"
alias gc="git commit"

# System
alias update="ujust update-all"
alias clean="ujust clean-all"
EOF
'

# Create development directories
runuser -l bazzite -c 'mkdir -p ~/dev ~/projects'
