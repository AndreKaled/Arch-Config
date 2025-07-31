#!/bin/bash

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
set -e

echo "Iniciando script de configuração do terminal"
echo "Atualizando o sistema..."

sudo pacman -Syu --noconfirm

comando_existe (){
    command -v "$1" >/dev/null 2>&1
}

# Configuração no terminal zshrc
ZSHRC_FILE="$HOME/.zshrc"
OH_MY_POSH_THEME="jblab_2021.omp.json"
OH_MY_POSH_BIN="$HOME/.local/bin"

instala () {
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
        sudo pacman -S --needed git base-devel
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si --noconfirm
        rm -rf /tmp/yay_install
        cd ..
    else
        echo "yay já está instalado."
    fi

    # instala zsh e define como shell padrao
    if ! comando_existe zsh; then
        echo "Zsh não detectado, instalando zsh..."
        sudo pacman -S zsh --noconfirm
    else
        echo "Zsh já está instalado."
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
        export PATH="$PATH:/home/$USER/.local/bin"

        # baixa a fonte Meslo
        echo "Baixando a fonte Meslo Nerd Font..."
        oh-my-posh font install meslo

        # baixa temas do Oh My Posh
        echo "Baixando temas do Oh My Posh..."
        mkdir -p ~/.poshthemes
        wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
        unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
        rm ~/.poshthemes/themes.zip
    else
        echo "Oh My Posh já está instalado."
    fi

    echo -e "\n--- Etapa de instalação completa ---\n"
}

config_zsh(){
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "definindo zsh como padrão..."
        chsh -s $(which zsh)
    fi
    if ! grep -q "oh-my-posh init" "$ZSHRC_FILE"; then
        echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/jblab_2021.omp.json)"' >> "$ZSHRC_FILE"
    fi
}

config_ohMyPosh(){
    if ! grep -q "pokemon-colorscripts" "$ZSHRC_FILE"; then
    echo -e "\n# exibe pokemon aleatorio ao iniciar o terminal" >> "$ZSHRC_FILE"
    echo 'if [ -x "$(command -v pokemon-colorscripts)" ]; then' >> "$ZSHRC_FILE"
    echo '  pokemon-colorscripts --random' >> "$ZSHRC_FILE"
    echo 'fi' >> "$ZSHRC_FILE"
    fi

    # comenta zsh_theme se estiver usando oh-my-posh
    if grep -q "^ZSH_THEME=" "$ZSHRC_FILE"; then
        sed -i 's/^ZSH_THEME=/#ZSH_THEME=/g' "$ZSHRC_FILE"
    fi

    # muda o tema
    if ! grep -q "oh-my-posh init" "$ZSHRC_FILE"; then
        echo -e "\n# Inicializa oh My Posh com o tema selecionado" >> "$ZSHRC_FILE"
        echo 'eval "$(oh-my-posh init zsh --config ~/.poshthemes/jblab_2021.omp.json)"' >> "$ZSHRC_FILE"
    fi
}

instala

echo -e "--- Iniciando configuração ---"

config_zsh
config_ohMyPosh

echo -e "\n--- Etapa de configuração completa ---\n"

echo "|-------------------------------------|"
echo "|-------------- FIM :D ---------------|"
echo "|-------------------------------------|"
echo ""

exec zsh