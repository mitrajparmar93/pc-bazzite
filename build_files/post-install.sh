#!/usr/bin/env bash

set -oue pipefail

# Set zsh as default shell
chsh -s /bin/zsh root
chsh -s /bin/zsh bazzite

# Install oh-my-zsh for default user
runuser -l bazzite -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'

# Copy starship config
runuser -l bazzite -c 'mkdir -p ~/.config'
cp /ctx/starship.toml /home/bazzite/.config/starship.toml
chown bazzite:bazzite /home/bazzite/.config/starship.toml

# Configure starship prompt
runuser -l bazzite -c 'echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc'

# Enable zsh plugins
runuser -l bazzite -c 'cat >> ~/.zshrc << "EOF"

# Zsh enhancements
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls="eza --icons"
alias ll="eza -l --icons"
alias la="eza -la --icons"
alias cat="bat"
alias vim="nvim"
alias reload="source ~/.zshrc"
alias mdcat="glow"

# Podman aliases (Docker compatibility)
alias docker="podman"
alias docker-compose="podman-compose"

# Git shortcuts
alias gs="git status"
alias gp="git pull"
alias gc="git commit"

# System
alias update="ujust update-all"
alias clean="ujust clean-all"
alias show-dir-usage="du . -h --max-depth=2 2>/dev/null | sort -hr"

# Cursor navigation (Option+Arrow keys)
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

# Enhanced fzf with preview
fuzzy() {
    fzf --border --padding 1,2 \
        --preview 'bat --color=always {}' \
        --bind 'ctrl-/:toggle-preview'
}
EOF
'

# Create development directories
runuser -l bazzite -c 'mkdir -p ~/dev ~/projects'

# Install Vicinae launcher (Raycast alternative)
VICINAE_VERSION="0.9.4"
curl -L "https://github.com/vicinaehq/vicinae/releases/download/v${VICINAE_VERSION}/vicinae-${VICINAE_VERSION}-1.x86_64.rpm" -o /tmp/vicinae.rpm
rpm-ostree install /tmp/vicinae.rpm
rm /tmp/vicinae.rpm
