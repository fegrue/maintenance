# Installiere zsh und benötigte Tools je nach Distribution:
if command -v apt-get &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y zsh git curl wget
elif command -v dnf &>/dev/null; then
    sudo dnf install -y zsh git curl wget
elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm zsh git curl wget
else
    echo "Bitte zsh, git, curl und wget manuell installieren."
fi

# Zsh als Standardshell setzen:
chsh -s $(which zsh)

# Oh My Zsh installieren:
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
