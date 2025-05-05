#!/usr/bin/env bash

# Always work from the script's location
cd "$(dirname "$0")"
# ---- Run pacman as root ----
echo "Installing system packages..."
sudo pacman -Syu
sudo pacman -S --noconfirm git base-devel xdg-user-dirs foot hyprland swww hyprlock hypridle hyprpicker dunst waybar fish tar nvim hyprpolkitagent xdg-desktop-portal-hyprland qt5-wayland qt6-wayland cliphist pipewire wireplumber brightnessctl ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono nwg-look qt5ct qt6ct kvantum nautilus fastfetch
xdg-user-dirs-update
# ---- Run yay as original user (non-root) ----
echo "Installing AUR packages with yay..."
yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

sudo tar -xvf /home/$ORIGINAL_USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/
sudo tar -xvf /home/$ORIGINAL_USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/
#
cp -r /home/$ORIGINAL_USER/hypr-dots/assets/config/* /home/$ORIGINAL_USER/.config/
