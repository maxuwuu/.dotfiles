#!/bin/bash

REPO_URL="https://github.com/maxuwuu/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
LINUX_DIR="$DOTFILES_DIR/linux"

HOME_FILES=(".nanorc" ".gitconfig" ".bashrc")
CONFIG_FILES=("i3" "rofi" "polybar" "neofetch" "nitrogen" "dunst")
PACKAGES_ARCH=("alacritty" "picom" "rofi" "polybar" "firefox" "flatpak" "snapd" "gnome-software" "dunst")
PACKAGES_UBUNTU=("alacritty" "picom" "rofi" "polybar" "firefox" "gnome-software" "flatpak" "snapd" "dunst")
PACKAGES_FEDORA=("alacritty" "picom" "rofi" "polybar" "firefox" "gnome-software" "flatpak" "snapd" "dunst")

install_packages() {
    if command -v pacman &>/dev/null; then
        sudo pacman -Syu --noconfirm "${PACKAGES_ARCH[@]}"
    elif command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y "${PACKAGES_UBUNTU[@]}"
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y "${PACKAGES_FEDORA[@]}"
    else
        exit 1
    fi
}

backup_and_symlink() {
    local file_or_dir="$1"
    local target="$2"
    if [ -e "$target" ] || [ -L "$target" ]; then
        mv "$target" "${target}.bak"
    fi
    ln -s "$file_or_dir" "$target"
}

read -p "Do you want to install dotfiles and required packages? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
    install_packages

    if [ -d "$DOTFILES_DIR" ]; then
        mv "$DOTFILES_DIR" "${DOTFILES_DIR}.bak"
    fi

    git clone "$REPO_URL" "$DOTFILES_DIR"

    mkdir -p "$CONFIG_DIR"

    for file in "${HOME_FILES[@]}"; do
        backup_and_symlink "$DOTFILES_DIR/$file" "$HOME/$file"
    done

    if [ -f "$LINUX_DIR/.bashrc" ]; then
        backup_and_symlink "$LINUX_DIR/.bashrc" "$HOME/.bashrc"
    fi

    for dir in "${CONFIG_FILES[@]}"; do
        backup_and_symlink "$DOTFILES_DIR/$dir" "$CONFIG_DIR/$dir"
    done

    echo "Installation complete!"
else
    install_packages
    echo "Packages installed, dotfiles were not installed."
fi
