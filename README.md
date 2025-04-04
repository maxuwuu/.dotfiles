# .dotfiles
a I3WM repository. it has my config files
# screenshots
![image](https://github.com/maxuwuu/.dotfiles/blob/main/Screenshots/4.png)
![image](https://github.com/maxuwuu/.dotfiles/blob/main/Screenshots/0.png)

# dependencies

- i3
- nitrogen/feh
- polybar
- i3lock 
- alacritty
- rofi
- neofetch
- dunst

  # installition


- First, remove all services and applications that come with the desktop environment 


=== Debian / Ubuntu / Mint / Pop!_OS ===

GNOME

sudo apt purge --auto-remove gnome gnome-core gnome-shell

KDE Plasma

sudo apt purge --auto-remove kde-plasma-desktop plasma-desktop kde-standard

Xfce

sudo apt purge --auto-remove xfce4 xfce4-goodies

Cinnamon

sudo apt purge --auto-remove cinnamon cinnamon-desktop-environment

MATE

sudo apt purge --auto-remove mate-desktop-environment mate-desktop-environment-core

LXDE

sudo apt purge --auto-remove lxde lxde-core lxde-common

LXQt

sudo apt purge --auto-remove lxqt lxqt-core

Budgie

sudo apt purge --auto-remove ubuntu-budgie-desktop budgie-desktop

Deepin

sudo apt purge --auto-remove dde dde-desktop

Enlightenment

sudo apt purge --auto-remove enlightenment terminology

i3

sudo apt purge --auto-remove i3 i3-wm i3status dmenu

Openbox

sudo apt purge --auto-remove openbox obconf tint2

AwesomeWM

sudo apt purge --auto-remove awesome

Clean 

sudo apt autoremove sudo apt clean

=== Fedora / RHEL / CentOS / AlmaLinux / Rocky ===

GNOME

sudo dnf remove gnome-shell gnome-session gnome-control-center

KDE Plasma

sudo dnf remove @kde-desktop @kde-apps plasma-desktop

Xfce

sudo dnf remove @xfce-desktop xfce*

Cinnamon

sudo dnf remove @cinnamon-desktop cinnamon*

MATE

sudo dnf remove @mate-desktop mate*

LXDE

sudo dnf remove @lxde-desktop lxde*

LXQt

sudo dnf remove @lxqt-desktop lxqt*

Budgie

sudo dnf remove budgie-desktop

Deepin

sudo dnf remove deepin-desktop dde*

Enlightenment

sudo dnf remove enlightenment terminology

i3

sudo dnf remove i3 i3status dmenu

Openbox

sudo dnf remove openbox obconf tint2

AwesomeWM

sudo dnf remove awesome

Clean

sudo dnf autoremove

=== Arch Linux / Manjaro / EndeavourOS / Garuda ===

GNOME

sudo pacman -Rns gnome gnome-extra

KDE Plasma

sudo pacman -Rns plasma kde-applications

Xfce

sudo pacman -Rns xfce4 xfce4-goodies

Cinnamon

sudo pacman -Rns cinnamon

MATE

sudo pacman -Rns mate mate-extra

LXDE

sudo pacman -Rns lxde

LXQt

sudo pacman -Rns lxqt

Budgie

sudo pacman -Rns budgie-desktop

Deepin

sudo pacman -Rns deepin deepin-extra

Enlightenment

sudo pacman -Rns enlightenment terminology

i3

sudo pacman -Rns i3-wm i3status dmenu

Openbox

sudo pacman -Rns openbox obconf tint2

AwesomeWM

sudo pacman -Rns awesome

Temizlik

sudo pacman -Rns $(pacman -Qdtq)

=== openSUSE ===

GNOME

sudo zypper remove gnome-shell gnome-session gnome-control-center

KDE Plasma

sudo zypper remove plasma5-desktop kde5

Xfce

sudo zypper remove xfce4 xfce4-goodies

Cinnamon

sudo zypper remove cinnamon

MATE

sudo zypper remove mate-desktop-environment

LXDE

sudo zypper remove lxde

LXQt

sudo zypper remove lxqt

Budgie

sudo zypper remove budgie-desktop

Deepin

sudo zypper remove deepin-desktop-environment

Enlightenment

sudo zypper remove enlightenment

Clean

sudo zypper remove --clean-deps

=== Gentoo ===

GNOME

sudo emerge --unmerge gnome-shell gnome-session

KDE Plasma

sudo emerge --unmerge kde-plasma/plasma-meta

Xfce

sudo emerge --unmerge xfce-base/xfce4-meta

Cinnamon

sudo emerge --unmerge cinnamon

MATE

sudo emerge --unmerge mate-base/mate-meta

LXDE

sudo emerge --unmerge lxde

LXQt

sudo emerge --unmerge lxqt

Budgie

sudo emerge --unmerge budgie

Deepin

sudo emerge --unmerge deepin

Enlightenment

sudo emerge --unmerge enlightenment

Clean 

sudo emerge --depclean

=== Kali Linux ===

GNOME

sudo apt purge --auto-remove gnome-shell gnome-session

KDE Plasma

sudo apt purge --auto-remove kde-plasma-desktop plasma-desktop kde-standard

Xfce

sudo apt purge --auto-remove xfce4 xfce4-goodies

Cinnamon

sudo apt purge --auto-remove cinnamon cinnamon-desktop-environment

MATE

sudo apt purge --auto-remove mate-desktop-environment mate-desktop-environment-core

LXDE

sudo apt purge --auto-remove lxde lxde-core lxde-common

LXQt

sudo apt purge --auto-remove lxqt lxqt-core

Budgie

sudo apt purge --auto-remove ubuntu-budgie-desktop budgie-desktop

Deepin

sudo apt purge --auto-remove dde dde-desktop

Enlightenment

sudo apt purge --auto-remove enlightenment terminology

Clean

sudo apt autoremove sudo apt clean

