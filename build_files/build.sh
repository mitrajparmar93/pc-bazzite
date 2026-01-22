#!/bin/bash

set -ouex pipefail

### Performance optimizations for gaming + development

# Gaming: Increase vm.max_map_count for better game compatibility
echo 'vm.max_map_count=2147483642' > /etc/sysctl.d/99-gaming.conf

# Faster boot: Reduce systemd timeout
mkdir -p /etc/systemd/system.conf.d
echo '[Manager]' > /etc/systemd/system.conf.d/timeout.conf
echo 'DefaultTimeoutStopSec=10s' >> /etc/systemd/system.conf.d/timeout.conf

# I/O scheduler optimization for NVMe/SSD
echo 'ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"' > /etc/udev/rules.d/60-ioschedulers.conf
echo 'ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"' >> /etc/udev/rules.d/60-ioschedulers.conf

# NVIDIA: Force performance mode
mkdir -p /etc/modprobe.d
echo 'options nvidia NVreg_RegistryDwords="PowerMizerEnable=0x1;PerfLevelSrc=0x2222;PowerMizerDefault=0x1;PowerMizerDefaultAC=0x1"' > /etc/modprobe.d/nvidia-performance.conf

# Enable services
systemctl enable podman.socket
systemctl enable docker.socket
