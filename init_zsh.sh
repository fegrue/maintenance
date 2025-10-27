# Installiere zsh, git, curl, wget (wie vorher)
if command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y zsh git curl wget fonts-powerline
elif command -v dnf &>/dev/null; then
    sudo dnf install -y zsh git curl wget powerline-fonts
elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm zsh git curl wget powerline-fonts
else
    echo "Bitte zsh, git, curl, wget und powerline fonts manuell installieren."
fi

# Zsh als Standardshell setzen:
chsh -s $(which zsh)

# Oh My Zsh installieren (unattended)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

# Powerlevel10k Klonen ins oh-my-zsh custom themes Verzeichnis
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# p10k als Theme in .zshrc setzen
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Hinweis zur Installation von empfohlenen Fonts (Nerd Fonts)
echo "Bitte installiere eine Nerd Font (z.B. MesloLGS NF) für bestes Powerlevel10k-Erlebnis."
echo "Fonts findest du hier: https://github.com/romkatv/powerlevel10k#manual-font-installation"

# Automatischer Start von zsh geladen mit Oh My Zsh und Powerlevel10k beim nächsten Login

echo "Installation abgeschlossen. Starte neue zsh oder melde dich neu an."
