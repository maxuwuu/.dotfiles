#!/bin/bash

REPO_URL="https://github.com/maxuwuu/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
CONFIG_DIR="$HOME/.config"
LINUX_DIR="$DOTFILES_DIR/linux"

HOME_FILES=(".nanorc" ".gitconfig")
CONFIG_FILES=("i3" "rofi" "polybar" "neofetch" "nitrogen")
PACKAGES=("bash" "neofetch" "nano" "git" "i3" "rofi" "polybar" "nitrogen" "feh")

install_packages() {
    if command -v apt &>/dev/null; then
        sudo apt update && sudo apt install -y "${PACKAGES[@]}"
    elif command -v dnf &>/dev/null; then
        sudo dnf install -y "${PACKAGES[@]}"
    elif command -v pacman &>/dev/null; then
        sudo pacman -Syu --noconfirm "${PACKAGES[@]}"
    else
        exit 1
    fi
}

read -p "Do you want to install dotfiles and required packages? (yes/no): " answer

if [[ "$answer" == "yes" ]]; then
    install_packages

    if [ -d "$DOTFILES_DIR" ]; then
        mv "$DOTFILES_DIR" "${DOTFILES_DIR}.bak"
    fi

    git clone "$REPO_URL" "$DOTFILES_DIR"

    mkdir -p "$CONFIG_DIR"

    for file in "${HOME_FILES[@]}"; do
        if [ -f "$HOME/$file" ] || [ -L "$HOME/$file" ]; then
            mv "$HOME/$file" "$HOME/${file}.bak"
        fi
        ln -s "$DOTFILES_DIR/$file" "$HOME/$file"
    done

    if [ -f "$LINUX_DIR/.bashrc" ]; then
        if [ -f "$HOME/.bashrc" ] || [ -L "$HOME/.bashrc" ]; then
            mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
        fi
        ln -s "$LINUX_DIR/.bashrc" "$HOME/.bashrc"
    fi

    for dir in "${CONFIG_FILES[@]}"; do
        if [ -d "$CONFIG_DIR/$dir" ] || [ -L "$CONFIG_DIR/$dir" ]; then
            mv "$CONFIG_DIR/$dir" "$CONFIG_DIR/${dir}.bak"
        fi
        ln -s "$DOTFILES_DIR/$dir" "$CONFIG_DIR/$dir"
    done

    echo "Installation complete!"
else
    install_packages
    echo "Packages installed, dotfiles were not installed."
fi