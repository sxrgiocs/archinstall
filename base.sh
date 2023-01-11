#!/bin/bash

# set time and date
ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
hwclock --systohc

# set the locales
sed -i '171s/.//' /etc/locale.gen # deletes the hashtag of line 171: en_US.UTF-8
sed -i '194s/.//' /etc/locale.gen # deletes the hashtag of line 178: es_ES.UTF-8
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# hosts
HOSTNAME=
echo $HOSTNAME >> /etc/hosts
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 $HOSTNAME.localdomain $HOSTNAME"

# set the pacman mirrors
pacman -S --noconfirm reflector rsync
reflector --verbose -c Germany -c France -c Spain --age 12 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# install yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
cd ..
rm -rf yay-bin

# setup asus repository (only for ROG laptops)
echo "[g14]" >> /etc/pacman.conf
echo "SigLevel = DatabaseNever Optional TrustAll" >> /etc/pacman.conf
echo "Server = https://arch.asus-linux.org" >> /etc/pacman.conf

# install packages
pacman -Syyy
pacman -S --noconfirm grub efibootmgr os-prober \
                      networkmanager dialog wpa_supplicant iwd inetutils dnsutils\
                      bluez bluez-utils \
                      cups hplip \
                      alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack pavucontrol \
                      mtools dosfstools xdg-utils xdg-user-dirs bat lsd ranger stow ueberzug xclip binutils glu fzf \
                      gvfs nfs-utils ntfs-3g udiskie \
                      acpi acpi_call acpid lm-sensors \
                      jre-openjdk jdk-openjdk \
                      flatpak \
                      archlinux-keyring \
                      gzip p7zip unrar zip \
                      nvidia nvidia-prime nvidia-utils nvidia-settings \
                      # xf86-video-amdgpu
                      asusctl

yay -S --noconfirm timeshift-autosnap timeshift-bin zramd \
       downgrade

# install fonts
pacman -S --noconfirm noto-fonts noto-fonts-emoji noto-fonts-cjk 
yay -S --noconfirm nerd-fonts-jetbrains-mono ttf-google-sans ttf-symbola
                      

# set up dual boot
$WINPART=
mkdir /mnt/winboot
mount /dev/$WINPART /mnt/winboot

# set up grub
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# enable services
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable acpid
systemctl enable zramd.service
systemctl enable --now power-profiles-daemon.service # only for asus
systemctl --user enable asus-notify.service # only for asus

# users and password
USER="sergio"
PASSWD="pergamino"
echo root:$PASSWD | chpasswd
useradd -m $USER
echo $USER:PASSWD | chpasswd
usermod -aG wheel $USER
echo "$USER ALL=(ALL) ALL" >> /etc/sudoers.d/$USER

printf "\e[1;32mDone! To finish, type exit, umount -a and reboot.\e[0m"
