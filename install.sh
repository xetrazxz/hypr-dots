#!/usr/bin/env bash

# Always work from the script's location
cd "$(dirname "$0")"

# Get the original user (not root, even if using sudo)
if [ "$SUDO_USER" ]; then
    ORIGINAL_USER="$SUDO_USER"
else
    ORIGINAL_USER="$(whoami)"
fi

# Get the original user's home directory
USER_HOME=$(eval echo "~$ORIGINAL_USER")

#Get Yay
sudo -u "$ORIGINAL_USER" git clone https://aur.archlinux.org/yay.git /home/$ORIGINAL_USER/yay
cd /home/$ORIGINAL_USER/yay
makepkg -si
cd && rm -rf /home/$ORIGINAL_USER/yay

# ---- Run pacman as root ----
echo "Installing system packages..."
sudo pacman -Syu
sudo pacman -S --noconfirm git base-devel xdg-user-dirs hyprland swww hyprlock hypridle hyprpicker dunst waybar foot tar nvim hyprpolkitagent xdg-desktop-portal-hyprland qt5-wayland qt6-wayland cliphist pipewire wireplumber brightnessctl ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono nwg-look qt5ct qt6ct kvantum nautilus neofetch
sudo -u "$ORIGINAL_USER" xdg-user-dirs-update
# ---- Run yay as original user (non-root) ----
echo "Installing AUR packages with yay..."
sudo -u "$ORIGINAL_USER" yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

# ---- Copy file to user's home directory ----
sudo chown "$ORIGINAL_USER:$ORIGINAL_USER" "/home/ORIGINALUSER/.config/myfile.conf"


sudo tar -xvf /home/$ORIGINAL_USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/
sudo tar -xvf /home/$ORIGINAL_USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/
sudo cp -r /home/$ORIGINAL_USER/hypr-dots/assets/BG/ /home/$ORIGINAL_USER/Pictures/
sudo cp -r /home/$ORIGINAL_USER/hypr-dots/config/* /home/$ORIGINAL_USER/.config
sudo chown "$ORIGINAL_USER:$ORIGINAL_USER" /home/$ORIGINALUSER/.config/*
#
echo "DONE"
echo "run 'nwg-look' and set GTK and Icon Theme"
echo "run 'sudo -E kvantummanager' and set Catppuccin Theme"
echo "run 'qt6ct' to set icon theme"
