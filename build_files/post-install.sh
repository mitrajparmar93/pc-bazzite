#!/usr/bin/env bash

set -oue pipefail

# Set default shell to zsh for root and the default user
chsh -s /bin/zsh root
chsh -s /bin/zsh bazzite

# Install oh-my-zsh for default user
runuser -l bazzite -c 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended'

# Configure starship prompt for the user
runuser -l bazzite -c 'mkdir -p ~/.config && echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc'
