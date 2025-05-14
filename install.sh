#!/usr/bin/env bash
cd "$(dirname "$0")"
echo "USERNAME"
read $USER
# Install official packages
sudo pacman -S --noconfirm xdg-user-dirs foot hyprland swww hyprlock hyprpicker dunst waybar fish tar nvim xdg-desktop-portal-hyprland qt5-wayland qt6-wayland cliphist
  
sudo pacman -S  --noconfirm pipewire wireplumber pipewire-audio brightnessctl ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono nwg-look kvantum yazi fastfetch

yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

echo "Setting up user directories..."
xdg-user-dirs-update

# Extract themes and icons
echo "Installing themes and icons..."
THEME_SRC="/home/$USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz"
ICON_SRC="/home/$USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz"

sudo tar -xf "$THEME_SRC" -C /usr/share/themes/
sudo tar -xf "$ICON_SRC" -C /usr/share/icons/

# Clone wallpapers
mkdir -p /home/$USER/Pictures/walls/
WALLPAPER_DIR=/home/$USER/Pictures/walls/catppuccin
git clone https://github.com/orangci/walls-catppuccin-mocha.git $WALLPAPER_DIR
