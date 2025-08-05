#!/bin/bash

# Script de automação para instalação de alguns apps no Arch Linux
# Desenvolvido por André Kaled Duarte Coutinho Andrade
# -------------------------------------------------------------------
# Este script automatiza a instalação de:

# Apps:
# - Vivaldi
# - Discord
# - VS Code
# - Flameshot
# - Tor 
# - qBittorrent
# - btop
# - Dolphin emulator
# - Grub customizer
# - Oracle VirtualBox
# - Git

# Linguagens instaladas
# - Java 24
# - Kotlin
# - PHP 8 
set -e

echo "Iniciando script de instalação de apps e linguagens de programação"
echo "Atualizando o sistema..."

sudo pacman -Syu --noconfirm

comando_existe (){
    command -v "$1" >/dev/null 2>&1
}

git(){
    if ! comando_existe git; then
        echo "git não detectado, Instalando git..."
        sudo pacman -S git --noconfirm
    else
        echo "git já instalado."
    fi
}
yay(){
    if ! comando_existe yay; then
        echo "yay não detectado, instalando yay..."
        sudo pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        rm -rf /tmp/yay_install
        cd ..
    else
        echo "yay já está instalado."
    fi
}
flatpak(){
    if ! comando_existe flatpak; then
        echo "flatpak não detectado, instalando flatpak..."
        sudo pacman -S flatpak
    else
        echo "flatpak já está instalado."
    fi
}
discord(){
    flatpak()
    if ! comando_existe discord; then
        echo "discord não detectado, instalando discord..."
        flatpak install discord
    else
        echo "discord já está instalado."
    fi
}
instala () {

}