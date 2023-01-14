#!/bin/bash

# install yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# timsehift and snapshots
yay -S --noconfirm timeshift-autosnap timeshift-bin zramd

# install fonts
pacman -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk 
yay -S --noconfirm nerd-fonts-jetbrains-mono ttf-google-sans ttf-symbola

# systemd
systemctl --user enable asus-notify.service # only for asus
systemctl enable zramd.service

### GENERAL PACKAGES ##################################################################################################

# display manager
pacman -S --noconfirm xorg xorg-xinit xorg-xkill

# latex
pacman -S --noconfirm biber texlive-core texinfo texlive-bibextra texlive-fontsextra texlive-langextra texlive-pictures

# terminal
pacman -S --noconfirm kitty

# shell
pacman -S --noconfirm zsh zsh-autosuggestions zsh-syntax-highlighting zsh-theme-powerlevel10k
# then run chsh

# web browser
pacman -S --noconfirm firefox

# PDF viewer
pacman -S --noconfirm okular zathura zathura-pdf-poppler

# misc
pacman -S --noconfirm bitwarden thunar tumbler qbittorrent qt5ct ranger tk viewnior xarchiver obs-studio


### AUR PACKAGES ######################################################################################################

# misc yay packages
yay -S --noconfirm notion-app nvim-packer-git qt5-styleplugins tor-browser touchegg visual-studio-code-bin google-chrome downgrade

# bioeng packages
pacman -S --noconfirm python-virtualenv
yay -S 3dslicer-bin

### FLATPAK ###########################################################################################################
flatpak -y discord spotify signal whatsapp zotero whatsappforlinux

### WM/DESKTOP ########################################################################################################

# GNOME
pacman -S --noconfirm gnome-shell gnome-tweaks gnome-control-center gnome-calendar
yay -S --noconfirm extension-manager
yay -S --noconfirm gnome-shell-extension-alphabetical-grid-extension gnome-shell-extension-appindicator \
                   gnome-shell-extension-bluetooth-quick-connect gnome-shell-extension-blur-my-shell \
                   gnome-shell-extension-clipboard-history gnome-shell-extension-gsconnect \
                   gnome-shell-extension-hide-universal-access gnome-shell-extension-quick-settings-tweaks-git \
                   gnome-shell-extension-vitals gnome-shell-extension-wintile
                   
# AWESOME WM
yay -S picom-git wezterm rofi acpi acpid acpi_call upower lxappearance-gtk3 \
jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift \
brightnessctl feh scrot \
mpv mpd mpc mpdris2 python-mutagen ncmpcpp playerctl --needed

