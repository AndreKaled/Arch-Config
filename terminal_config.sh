#!/bin/zsh

# Script de automação para a personalização do MEU terminal no Arch Linux
# Desenvolvido por André Kaled Duarte Coutinho Andrade
# -------------------------------------------------------------------
# Este script automatiza a instalação e configuração de:
# - Pokémon Colorscripts
# - Oh My Posh
# - Nerd Fonts (Meslo)

# AVISO
# |-------------------------------------------------------|
# | Faça o backup de seu ~/.zshrc se não se sentir seguro |
# |-------------------------------------------------------|

echo "Atualizando o sistema..."

sudo pacman -Syu --noconfirm

comando_existe (){
    command -v "$1" >/dev/null 2>&1
}

# instala git se nao tiver
if ! comando_existe git; then
    echo "git não detectado, Instalando git..."
    sudo pacman -S git --noconfirm
else
    echo "git já instalado."
fi

# instala yay se nao tiver
if ! comando_existe yay; then
    echo "yay não detectado, instalando yay..."
    pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    rm -rf /tmp/yay_install
else
    echo "yay já está instalado."
fi

# instala pokemon-colorscripts se nao tiver
if ! comando_existe pokemon-colorscripts; then
    echo "Instalando pokemon-colorscripts..."
    yay -S pokemon-colorscripts-git --noconfirm
else
    echo "pokemon-colorscripts já está instalado."
fi

# instala oh-my-posh se nao tiver
if ! comando_existe oh-my-posh; then
    echo "Instalando Oh My Posh..."
    curl -s https://ohmyposh.dev/install.sh | bash -s
    export PATH=$PATH:
else
    echo "Oh My Posh já está instalado."
fi

echo "fim :D"