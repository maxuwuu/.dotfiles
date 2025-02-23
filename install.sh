

#!/bin/bash

git clone https://github.com/maxuwuu/.dotfiles.git ~/dotfiles


if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y i3 dmenu polybar feh dolphin konsole  
elif command -v pacman &> /dev/null; then
    sudo pacman -Syu --noconfirm i3 dmenu polybar feh dolphin konsole
elif command -v dnf &> /dev/null; then
    sudo dnf install -y i3 dmenu polybar feh dolphin konsole
elif command -v zypper &> /dev/null; then
    sudo zypper install -y i3 dmenu polybar feh dolphin konsole
else
    echo "Unsupported distribution!"
    exit 1
fi

mkdir -p ~/.config
ln -sf ~/dotfiles/config/i3 ~/.config/i3
ln -sf ~/dotfiles/.bashrc ~/.bashrc

echo "Installation completed. Please restart your session or reload i3."






