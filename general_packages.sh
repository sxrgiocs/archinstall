#!/bin/bash


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

# web brosers
pacman -S --noconfirm firefox
yay -S --noconfirm google-chrome

# PDF viewer
pacman -S --noconfirm okular zathura zathura-pdf-poppler

# misc
pacman -S --noconfirm bitwarden pcmanfm qbittorrent qt5ct ranger tk viewnior xarchiver


### AUR PACKAGES ######################################################################################################

# misc yay packages
yay -S --noconfirm notion-app nvim-packer-git qt5-styleplugins tor-browser touchegg visual-studio-code-bin

# bioeng packages
yay -S 3dslicer-bin

### FLATPAK ###########################################################################################################

flatpak -y discord spotify signal whatsapp zotero whatsappforlinux

### WM/DESKTOP ########################################################################################################

# GNOME
pacman -S --noconfirm gnome-shell gnome-tweaks gnome-control-center
yay -S --noconfirm extension-manager
yay -S --noconfirm gnome-shell-extension-alphabetical-grid-extension gnome-shell-extension-appindicator \
                   gnome-shell-extension-bluetooth-quick-connect gnome-shell-extension-blur-my-shell \
                   gnome-shell-extension-clipboard-history gnome-shell-extension-gsconnect \
                   gnome-shell-extension-hide-universal-access gnome-shell-extension-quick-settings-tweaks-git \
                   gnome-shell-extension-vitals gnome-shell-extension-wintile

