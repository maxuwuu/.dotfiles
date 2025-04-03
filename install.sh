#!/bin/bash

REPO_URL="https://github.com/maxuwuu/.dotfiles.git"

echo "Starting installation..."

read -p "Do you want to install all software and configuration files? (Y/N): " install_all
if [[ "$install_all" != "Y" && "$install_all" != "y" ]]; then
    echo "Installation canceled. No software will be installed."
    exit 0
fi

if [ -f /etc/debian_version ]; then
    DISTRO="debian"
    sudo apt update
    sudo apt install -y \
        i3 nitrogen feh polybar gnome-software alacritty rofi neofetch dunst nemo \
        snapd flatpak gnome-software-plugin-snap
    sudo apt install -y gnome-software-plugin-snap
    sudo systemctl enable --now snapd
    sudo systemctl enable --now flatpak

elif [ -f /etc/arch-release ]; then
    DISTRO="arch"
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm \
        i3 nitrogen feh polybar gnome-software alacritty rofi neofetch dunst nemo \
        snapd flatpak gnome-software-plugin-snap
    sudo systemctl enable --now snapd
    sudo systemctl enable --now flatpak

elif [ -f /etc/gentoo-release ]; then
    DISTRO="gentoo"
    sudo emerge --sync
    sudo emerge -av \
        i3 nitrogen feh polybar gnome-software alacritty rofi neofetch dunst nemo \
        snapd flatpak

elif [ -f /etc/kali-release ]; then
    DISTRO="kali"
    sudo apt update
    sudo apt install -y \
        i3 nitrogen feh polybar gnome-software alacritty rofi neofetch dunst nemo \
        snapd flatpak gnome-software-plugin-snap
    sudo systemctl enable --now snapd
    sudo systemctl enable --now flatpak

elif [ -f /etc/os-release ] && grep -q "NixOS" /etc/os-release; then
    DISTRO="nixos"
    nix-env -iA nixpkgs.i3 \
        nixpkgs.nitrogen nixpkgs.fehr nixpkgs.polybar \
        nixpkgs.gnome-software nixpkgs.alacritty \
        nixpkgs.rofi nixpkgs.neofetch nixpkgs.dunst

else
    echo "Unsupported system detected. Please install the required software manually."
    exit 1
fi

git clone $REPO_URL ~/.dotfiles

ln -sf ~/.dotfiles/linux/bashrc ~/.bashrc
ln -sf ~/.dotfiles/i3/config ~/.config/i3/config
ln -sf ~/.dotfiles/neofetch/config.conf ~/.config/neofetch/config.conf
ln -sf ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/.dotfiles/Alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf ~/.dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi

echo "Installing snap applications..."
sudo snap install vlc

echo "Installing flatpak applications..."
sudo flatpak install flathub org.videolan.VLC

echo "Installation complete!"
exit 0
