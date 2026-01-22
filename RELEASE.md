# pc-bazzite v1.0.0 - NVIDIA Gaming & Development Workstation

Custom Bazzite image optimized for high-performance gaming and development on NVIDIA hardware.

## 🎯 Target Hardware

- **GPU**: NVIDIA 3060Ti (or similar)
- **RAM**: 64GB (32GB @ 3600MHz + 32GB @ 2400MHz)
- **Displays**: Dual monitor (QHD 180Hz + FHD)
- **Storage**: NVMe/SSD

## 🎮 Gaming Optimizations

- **NVIDIA Performance Mode**: Forced maximum performance settings
- **Increased vm.max_map_count**: Better game compatibility (2147483642)
- **Optimized I/O Schedulers**: NVMe/SSD performance tuning
- **GameMode**: Automatic CPU/GPU optimization during gameplay
- **MangoHUD**: FPS and performance overlay
- **GOverlay**: GUI for MangoHUD configuration

## 💻 Development Tools

### Languages & Runtimes
- Python 3 + pip
- Node.js
- Go
- Development tools (@development-tools)

### Container & Infrastructure
- **Podman** (rootless, daemonless Docker alternative)
- podman-compose
- Terraform

### Modern CLI Tools
- **bat**: Better cat with syntax highlighting
- **eza**: Better ls with icons
- **ripgrep**: Fast grep
- **fd-find**: Fast find
- **fzf**: Fuzzy finder
- **btop**: Better htop
- **ncdu**: Disk usage analyzer
- **tldr**: Simplified man pages
- **fastfetch**: System info

### Shell Experience
- **zsh** with oh-my-zsh
- **Starship** prompt
- Pre-configured aliases for productivity

## 📦 Applications (Flatpak)

### Development
- Visual Studio Code
- Postman API client
- Podman Desktop

### Productivity
- Obsidian (notes)
- Bitwarden (password manager)
- Slack

### Browsers
- Zen Browser
- Firefox

### Media
- Spotify

### Utilities
- Flatseal (Flatpak permissions)
- Extension Manager (GNOME extensions)

## ⚡ Performance Tweaks

- **Fast Boot**: Reduced systemd timeout (10s)
- **NVMe Optimization**: No I/O scheduler overhead
- **SSD Optimization**: mq-deadline scheduler
- **NVIDIA Power**: Maximum performance mode enforced

## 🔧 System Configuration

### Pre-configured Aliases
```bash
# Modern CLI tools
ls → eza --icons
cat → bat
vim → nvim

# Docker compatibility
docker → podman
docker-compose → podman-compose

# Git shortcuts
gs → git status
gp → git pull
gc → git commit
```

### Network Tools
- WireGuard
- OpenVPN

## 📥 Installation

### Option 1: Rebase from Existing Bazzite
```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mitrajparmar93/pc-bazzite:latest
systemctl reboot
```

### Option 2: Fresh Install
1. Install standard Bazzite from https://download.bazzite.gg
2. After first boot, run the rebase command above

## 🎯 Use Cases

- **Competitive FPS Gaming**: Optimized for Call of Duty, CS2, Overwatch 2
- **Web Development**: Node.js, Python, modern tooling
- **Infrastructure as Code**: Terraform, containers
- **Systems Engineering**: Full development toolchain
- **General Desktop Use**: Productivity apps, browsers, media

## ⚠️ Known Limitations

### Games That Won't Work
Due to anti-cheat restrictions on Linux:
- Call of Duty: Warzone (likely blocked)
- Fortnite
- Valorant
- Apex Legends
- Rainbow Six Siege
- PUBG

### Supported Games
- Counter-Strike 2
- Overwatch 2
- Destiny 2
- Most single-player titles
- Steam Deck verified games

## 🔄 Updates

System updates automatically via rpm-ostree. Rollback available via GRUB menu if issues occur.

```bash
# Manual update
rpm-ostree update
systemctl reboot
```

## 📚 Documentation

- [Bazzite Docs](https://docs.bazzite.gg/)
- [Podman Guide](https://docs.podman.io/)
- [Are We Anti-Cheat Yet?](https://areweanticheatyet.com/)

## 🏗️ Base Image

Built on: `ghcr.io/ublue-os/bazzite-nvidia:stable` (Fedora 40)

## 📝 Changelog

### v1.0.0 (2026-01-22)
- Initial release
- NVIDIA performance optimizations
- Development toolchain
- Gaming enhancements
- Modern CLI tools
- Podman-based container workflow
