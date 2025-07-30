
# Personalizando o terminal
## Pókemon ao abrir terminal
- Baixe o arquivo PKGBUILD [deste repositório](https://gitlab.com/phoneybadger/pokemon-colorscripts)
- Execute os comandos de instalação do projeto, para o Arch eu utilizei:
  ```zsh
  makepkg -cf
  sudo pacman -U <filename.pkg.tar.zst>
  yay -S pokemon-colorscripts-git
  ```
- Escreva no arquivo ```~/.zshrc``` o codigo abaixo (se utiliza o bash shell, o arquivo é ```~/.bashrc```):
  ```zsh
  if [ -x "$(command -v pokemon-colorscripts)" ]; then
      pokemon-colorscripts --random
  fi
  ```

## Cores e fontes com oh-my-posh
- Escolha o tema a ser usado [neste site](https://ohmyposh.dev/) 
- Se nao houver instalado, use o comando de instalação do framework
  ```bash
  curl -s https://ohmyposh.dev/install.sh | bash -s
  ```
- Use o comando a seguir para que seja reconhecido o comando oh-my-posh pelo sistema
  ```zsh
  export PATH=$PATH:/home/<seu-user>/.local/bin
  ```
- Confirme se funciona, use o comando
  ```zsh
  oh-my-posh
  ```
- Instale uma fonte
  ```zsh
  oh-my-posh font install <font>
  ```
- Crie uma pasta de temas
  ```zsh
  mkdir ~/.poshthemes
  ```
- Baixe o pacote de temas
  ```zsh
  wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
  ```
- Descompacte o pacote baixado
  ```zsh
  unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
  ```
- Apague o pacote compactado de temas
  ```zsh
  rm ~/.poshthemes/themes.zip
  ```
- Abra o arquivo de configuração do seu terminal
  ```zsh
  sudo nano ~/.zshrc
  ```
- Escreva no final do arquivo:
  ```zsh
  eval "$(oh-my-posh init zsh --config ~/.poshtheme/<seu-tema.omp.json>)"
  ```
- Comente a linha com ```ZSH_THEME``` se houver
- Reinicie o sistema para aplicar as alterações
  ```zsh
  reboot
  ```
