
#!/bin/bash

git clone https://github.com/maxuwuu/.dotfiles.git ~/dotfiles

if command -v apt &> /dev/null; then
    sudo apt update && sudo apt install -y i3 rofi polybar feh picom git
elif command -v pacman &> /dev/null; then
    sudo pacman -Syu --noconfirm i3 rofi polybar feh picom git
elif command -v dnf &> /dev/null; then
    sudo dnf install -y i3 rofi polybar feh picom git
elif command -v zypper &> /dev/null; then
    sudo zypper install -y i3 rofi polybar feh picom git
else
    echo "Unsupported distribution!"
    exit 1
fi

echo "exec i3" > ~/.xinitrc
startx

echo "Please select Enter and Alt keys in i3, then press Enter to continue."
read -p "Press Enter to continue..."

i3-msg exit

rm -rf ~/.config/i3
ln -sf ~/dotfiles/i3 ~/.config/i3

ln -sf ~/dotfiles/.bashrc ~/.bashrc

echo "New i3 configuration and .bashrc applied. You can restart i3 now."


