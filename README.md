# Arch Linux - Pós-instalação + Dotfiles

Este repositório contém meu script de pós-instalação do Arch Linux com todos os programas e configurações que uso, incluindo meus **dotfiles**.

## 📦 O que este script instala
- **Pacotes oficiais**:
  - `git`, `base-devel`, `wget`, `curl`, `zsh`, `jupyterlab`, `ventoy`, `plank`
- **Pacotes AUR**:
  - Rider  
  - Visual Studio Code  
  - Eclipse  
  - Postman  
  - GitHub CLI  
  - LunarVim  
  - Zsh Powerlevel10k  
  - Zsh Autosuggestions
- **Configurações personalizadas**:
  - `.zshrc`  
  - `.p10k.zsh`  
  - Temas e plugins do ZSH  
  - Configurações do LunarVim  
  - Configurações do Plank  

## 🚀 Instalação rápida

Após instalar o Arch Linux e ter acesso à internet, execute:

```bash
bash <(curl -s https://raw.githubusercontent.com/SEU_USUARIO/arch-setup/main/postinstall.sh)
