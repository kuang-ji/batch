#!/bin/bash

# 更新 apt 软件包索引并升级已安装的软件包
sudo apt update
sudo apt upgrade -y

# 安装 Linux 内核模块
sudo apt install -y linux-modules-extra-$(uname -r)
sudo modprobe binder_linux devices="binder,hwbinder,vndbinder"
sudo modprobe ashmem_linux

# 安装 Docker
curl -fsSL https://get.docker.com | sh

# 运行 Docker 容器
sudo docker run -itd --privileged \
    --memory-swappiness=0 \
    --restart=always \
    --pull always \
    -v ~/data11:/data \
    -p 5555:5555 \
    --name redroid11 \
    redroid/redroid:11.0.0-latest \
    redroid.gpu.mode=guest
