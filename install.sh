#!/bin/bash

GREEN="\e[32m"
RED="\e[31m"
RESET="\e[0m"

echo -e "${GREEN}Installation starting...${RESET}"

if [ -f /etc/os-release ]; then
    . /etc/os-release
    distro=$ID
else
    echo -e "${RED}Distribution not detected! Please manually set the package manager.${RESET}"
    exit 1
fi

echo -e "${GREEN}Detected distribution: $distro${RESET}"

install_packages() {
    case "$distro" in
        debian|ubuntu|pop|linuxmint)
            sudo apt update && sudo apt install -y i3 rofi polybar nitrogen nautilus konsole brave-browser neofetch git
            ;;
        fedora)
            sudo dnf install -y i3 rofi polybar nitrogen nautilus konsole brave-browser neofetch git
            ;;
        arch|manjaro)
            sudo pacman -Syu --noconfirm i3 rofi polybar nitrogen nautilus konsole brave-browser neofetch git
            ;;
        gentoo)
            sudo emerge --ask i3 rofi polybar nitrogen nautilus konsole brave-browser neofetch git
            ;;
        opensuse|opensuse-tumbleweed|opensuse-leap)
            sudo zypper install -y i3 rofi polybar nitrogen nautilus konsole brave-browser neofetch git
            ;;
        *)
            echo -e "${RED}This distribution is not supported! Please install manually.${RESET}"
            exit 1
            ;;
    esac
}

echo -e "${GREEN}Installing necessary packages...${RESET}"
install_packages

echo -e "${GREEN}Cloning .dotfiles repository...${RESET}"
git clone https://github.com/maxuwuu/.dotfiles ~/.dotfiles

echo -e "${GREEN}Copying configuration files...${RESET}"
mkdir -p ~/.config
cp -r ~/.dotfiles/i3 ~/.config/
cp -r ~/.dotfiles/polybar ~/.config/
cp -r ~/.dotfiles/rofi ~/.config/
cp -r ~/.dotfiles/nitrogen ~/.config/

if [ -d ~/.dotfiles/Wallpapers ]; then
    echo -e "${GREEN}Copying wallpapers...${RESET}"
    mkdir -p ~/Pictures/Wallpapers
    cp -r ~/.dotfiles/Wallpapers/* ~/Pictures/Wallpapers/
else
    echo -e "${RED}Wallpapers folder not found!${RESET}"
fi

echo -e "${GREEN}Installation complete! You can now restart i3.${RESET}"
