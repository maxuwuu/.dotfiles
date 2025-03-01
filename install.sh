

#!/bin/bash

git clone https://github.com/maxuwuu/.dotfiles.git ~/dotfiles


if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y i3 rofi polybar feh dolphin konsole firefox neofetch picom sddm 
elif command -v pacman &> /dev/null; then
    sudo pacman -Syu --noconfirm i3 rofi polybar feh dolphin konsole firefox neofetch picom sddm 
elif command -v dnf &> /dev/null; then
    sudo dnf install -y i3 rofi polybar feh dolphin konsole firefox screenfetch picom 
elif command -v zypper &> /dev/null; then
    sudo zypper install -y i3 rofi polybar feh dolphin konsole firefox screenfetch picom sddm
else
    echo "Unsupported distribution!"
    exit 1
fi

mkdir -p ~/.config
ln -sf ~/dotfiles/config/i3 ~/.config/i3
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/polybar ~/.config/polybar
echo "Installation completed. Please restart your session or reload i3."






