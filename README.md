# pc-bazzite

> Custom Bazzite image optimized for NVIDIA gaming and development workstations

[![Build Status](https://github.com/mitrajparmar93/pc-bazzite/actions/workflows/build.yml/badge.svg)](https://github.com/mitrajparmar93/pc-bazzite/actions)

## 🎯 What is this?

A custom [Bazzite](https://bazzite.gg/) image tailored for:
- **High-performance gaming** on NVIDIA GPUs
- **Web/systems development** with modern tooling
- **Dual monitor setups** (QHD 180Hz + FHD)
- **Container-based workflows** with Podman

## ⚡ Quick Start

```bash
# Rebase from any existing Bazzite installation
rpm-ostree rebase ostree-unverified-registry:ghcr.io/mitrajparmar93/pc-bazzite:latest
systemctl reboot
```

## 🎮 Gaming Features

- NVIDIA performance mode enforced
- GameMode + MangoHUD + GOverlay
- Optimized vm.max_map_count for compatibility
- NVMe/SSD I/O scheduler tuning

## 💻 Development Stack

- **Languages**: Python, Node.js, Go
- **Containers**: Podman + podman-compose
- **IaC**: Terraform
- **Shell**: zsh + oh-my-zsh + Starship
- **CLI Tools**: bat, eza, ripgrep, fzf, btop

## 📦 Pre-installed Apps

- VS Code, Postman, Podman Desktop
- Zen Browser, Firefox
- Obsidian, Bitwarden, Slack, Spotify

## 📖 Full Documentation

See [RELEASE.md](RELEASE.md) for complete feature list and installation guide.

## 🔧 Customization

This image is built from the [ublue-os/image-template](https://github.com/ublue-os/image-template). Fork and modify:
- `image.toml` - Packages and Flatpaks
- `Containerfile` - Base image
- `build_files/build.sh` - System configuration
- `build_files/post-install.sh` - User setup

## 🏗️ Base

Built on `ghcr.io/ublue-os/bazzite-nvidia:stable` (Fedora 40)

## 📝 License

Apache 2.0
