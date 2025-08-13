set -e

REPO_URL="https://github.com/MurilloHMS/arch-setup.git"
DOTFILES_DIR="$HOME/.dotfiles"

echo "============================"
echo " Atualizando o sistema..."
echo "============================"
sudo pacman -Syu

install_aur(){
    PACKAGE="$1"
    if yay -Qi "$PACKAGE" &>/dev/null; then
        echo "[OK] $PACKAGE já está instalado."
    else
        yay -S --noconfirm "$PACKAGE"
    fi
}

echo "============================"
echo " Instalando pacotes base..."
echo "============================"

sudo pacman -S --noconfirm git base-devel wget curl zsh ventoy plank

if ! command -v yay &>/dev/null; then
    echo "============================"
    echo " Instalando YAY..."
    echo "============================"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

echo "============================"
echo " Instalando pacotes do AUR..."
echo "============================"
install_aur "rider"
install_aur "visual-studio-code-bin"
install_aur "eclipse-java"
install_aur "postman-bin"
install_aur "github-cli"
install_aur "lunarvim-bin"
install_aur "zsh-theme-powerlevel10k"
install_aur "zsh-autosuggestions"

echo "============================"
echo " Baixando dotfiles..."
echo "============================"

if [-d "$DOTFILES_DIR"]; then
    echo "Atualizando dotfiles existentes..."
    git -C "$DOTFILES_DIR" pull
else
    git clone "$REPO_URL" "$DOTFILES_DIR"
fi

if ! command -v stow &>/dev/null; then
    sudo pacman -S --noconfirm stow
fi

cd "$DOTFILES_DIR/dotfiles"
stow --verbose --target="$HOME" .

if ["$SHELL" != "/bin/zsh"]; then
    chsh -s /bin/zsh
fi

echo "============================"
echo "Pós-instalação concluída!"
echo "Reinicie ou abra um novo terminal para carregar o ZSH."
echo "============================"