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
# - Youtube Music
# - Android Studio

# Linguagens instaladas
# - Java 24
# - Kotlin
# - PHP 8 
set -e

comando_existe (){
    command -v "$1" >/dev/null 2>&1
}

git_install(){
    if ! comando_existe git; then
        echo "Instalando git..."
        sudo pacman -S git --noconfirm
    else
        echo "git já instalado."
    fi
}

yay_install(){
    if ! comando_existe yay; then
        echo "yay não detectado, instalando yay..."
        sudo pacman -S --needed git base-devel --noconfirm
        git clone https://aur.archlinux.org/yay.git /tmp/yay_install
        (cd /tmp/yay_install && makepkg -si --noconfirm)
        rm -rf /tmp/yay_install
    else
        echo "yay já está instalado."
    fi
}

flatpak_install(){
    if ! comando_existe flatpak; then
        echo "flatpak não detectado, instalando flatpak..."
        sudo pacman -S flatpak --noconfirm
        echo "Adicionando repositório Flathub..."
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    else
        echo "flatpak já está instalado."
    fi
}

discord_install(){
    if ! comando_existe discord; then
        echo "Instalando discord..."
        flatpak install flathub com.discordapp.Discord -y
    else
        echo "discord já instalado."
    fi
}

vivaldi_install(){
    if ! comando_existe vivaldi; then
        echo "Instalando Vivaldi..."
        yay -S vivaldi --noconfirm
    else
        echo "Vivaldi já instalado."
    fi
}

tor_install(){
    if ! comando_existe torbrowser-launcher; then
        echo "Instalando Tor Browser..."
        sudo pacman -S torbrowser-launcher --noconfirm
    else
        echo "Tor Browser já instalado."   
    fi 
}

qBittorrent_install(){
    if ! comando_existe qbittorrent; then
        echo "Instalando qBittorrent..."
        sudo pacman -S qbittorrent --noconfirm
    else
        echo "qBittorrent já instalado."
    fi
}

dolphin_install(){
    if ! comando_existe dolphin-emu; then
        echo "Instalando dolphin-emu..."
        sudo pacman -S dolphin-emu --noconfirm
    else
        echo "dolphin-emu já instalado."
    fi
}

grubCustomizer_install(){
    if ! comando_existe grub-customizer; then
        echo "Instalando grub-customizer..."
        yay -S grub-customizer --noconfirm
    else
        echo "grub-customizer já instalado."
    fi
}

oracleVirtualBox_install(){
    if ! comando_existe virtualbox; then
        echo "Instalando virtualbox"
        sudo pacman -S virtualbox virtualbox-host-modules-arch --noconfirm
    else
        echo "virtualbox já instalado."
    fi
}

btop_install(){
    if ! comando_existe btop; then
        echo "Instalando btop"
        sudo pacman -S btop --noconfirm
    else
        echo "btop já instalado."
    fi
}

flameshot_install(){
    if ! comando_existe flameshot; then
        echo "Instalando flameshot"
        sudo pacman -S flameshot --noconfirm
    else
        echo "flameshot já instalado."
    fi
}

code_install(){
    if ! comando_existe code; then
        echo "Instalando code"
        sudo pacman -S code --noconfirm
    else
        echo "code já instalado."
    fi
}

androidStudio_install(){
    if ! comando_existe android-studio; then
        echo "Instalando android-studio..."
        yay -S android-studio --noconfirm
    else
        echo "android-studio já instalado."
    fi
}

youtubeMusic_install(){
    if ! comando_existe youtube-music; then
        echo "Instalando youtube-music..."
        yay -S youtube-music --noconfirm
    else
        echo "youtube-music já instalado."
    fi
}

java_install(){
    if ! comando_existe java; then
        echo "Instalando java..."
        sudo pacman -S jdk-openjdk --noconfirm
    else
        echo "java já instalado."
    fi
}

kotlin_install(){
    if ! comando_existe kotlin; then
        echo "Instalando kotlin..."
        sudo pacman -S kotlin --noconfirm
    else
        echo "kotlin já instalado."
    fi
}

php_install(){
    if ! comando_existe php; then
        echo "Instalando php..."
        sudo pacman -S php --noconfirm
    else
        echo "php já instalado."
    fi
}

installAll(){
    echo "Iniciando instalação completa."
    git_install
    yay_install
    flatpak_install
    discord_install
    vivaldi_install
    tor_install
    qBittorrent_install
    dolphin_install
    grubCustomizer_install
    oracleVirtualBox_install
    btop_install
    flameshot_install
    code_install
    androidStudio_install
    youtubeMusic_install
    java_install
    kotlin_install
    php_install
    echo "Instalação completa finalizada!"
}

selectAppsInstall(){
    echo "Escolha os apps e recursos para instalar (separados por espaço)."
    echo "----------------------------------------------------------------"
    echo "Apps:"
    echo "   1) Vivaldi"
    echo "   2) Discord"
    echo "   3) Code"
    echo "   4) Flameshot"
    echo "   5) Tor"
    echo "   6) qBittorrent"
    echo "   7) btop"
    echo "   8) Dolphin emulator"
    echo "   9) Grub customizer"
    echo "  10) Oracle VirtualBox"
    echo "  11) Git"
    echo "  12) Android Studio"    
    echo "  13) Youtube-music"
    echo ""
    echo "Linguagens de programação"
    echo "  14) Java"
    echo "  15) Kotlin"
    echo "  16) PHP"
    echo "----------------------------------------------------------------"
    read -p "Sua escolha (ex: 1 3 12): " opcoes_selecionadas
    for opcoes in $opcoes_selecionadas; do
        case $opcoes in
            1) yay_install; vivaldi_install ;;
            2) flatpak_install; discord_install ;;
            3) code_install ;;
            4) flameshot_install ;;
            5) tor_install ;;
            6) qBittorrent_install ;;
            7) btop_install ;;
            8) dolphin_install ;;
            9) grubCustomizer_install ;;
            10) oracleVirtualBox_install ;;
            11) git_install ;;
            12) androidStudio_install ;;
            13) yay_install; youtubeMusic_install ;;
            14) java_install ;;
            15) kotlin_install ;;
            16) php_install ;;
            *) echo "Opção inválida: $opcoes. Ignorando."
        esac
    done
    echo "Instalação das opções selecionadas concluída."
}

# Menu de instalação
echo "Iniciando script de automação para Arch Linux."
echo "Atualizando o sistema..."
sudo pacman -Syu --noconfirm

echo "--------------------------------------------------------"
echo "O que você gostaria de fazer?"
echo "1) Instalar todos os aplicativos/recursos do script."
echo "2) Selecionar quais aplicativos/recursos instalar."
echo "3) Sair."
echo "--------------------------------------------------------"
read -p "Sua escolha (1, 2 ou 3): " input_menu

case $input_menu in
    1)  
        installAll
        ;;
    2)
        selectAppsInstall
        ;;
    3) 
        echo "Saindo do script. Nenhuma alteração feita."
        exit 0
        ;;
    *)
        echo "Opção inválida, saindo do script."
        exit 1
        ;;
esac

echo "Script de instalação finalizado."