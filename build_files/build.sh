#!/bin/bash

set -ouex pipefail

### Performance optimizations for gaming + development

# Gaming: Increase vm.max_map_count for better game compatibility
echo 'vm.max_map_count=2147483642' > /etc/sysctl.d/99-gaming.conf

# Performance: Set performance governor as default
echo 'GOVERNOR="performance"' > /etc/default/cpupower

# Faster boot: Reduce systemd timeout
mkdir -p /etc/systemd/system.conf.d
cat > /etc/systemd/system.conf.d/timeout.conf << 'EOF'
[Manager]
DefaultTimeoutStopSec=10s
EOF

# I/O scheduler optimization for NVMe/SSD
cat > /etc/udev/rules.d/60-ioschedulers.conf << 'EOF'
ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"
ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
EOF

# NVIDIA: Force performance mode
mkdir -p /etc/modprobe.d
echo 'options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerDefault=0x1;PowerMizerDefaultAC=0x1"' > /etc/modprobe.d/nvidia-performance.conf

# Enable services
systemctl enable podman.socket
systemctl enable docker.socket

# Custom ujust commands
mkdir -p /usr/share/ublue-os/just
cat > /usr/share/ublue-os/just/60-custom.just << 'EOF'
# Update everything at once
update-all:
    rpm-ostree update
    flatpak update -y
    podman auto-update

# Deep clean system
clean-all:
    podman system prune -af
    flatpak uninstall --unused -y
    rpm-ostree cleanup -m
    
# Gaming: Enable performance mode
gaming-mode:
    powerprofilesctl set performance
    echo "Performance mode enabled"

# Dev: Install uv (Python package manager)
install-uv:
    curl -LsSf https://astral.sh/uv/install.sh | sh
EOF
