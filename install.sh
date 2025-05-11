#!/usr/bin/env bash
cd "$(dirname "$0")"
# Install official packages
echo "Installing system packages..."
sudo pacman -S --noconfirm \
  xdg-user-dirs foot hyprland swww hyprlock hyprpicker dunst waybar fish tar nvim \
  xdg-desktop-portal-hyprland hyprpolkitagent \
  qt5-wayland qt6-wayland cliphist
  
sudo pacman -S  --noconfirm pipewire wireplumber pipewire-audio pipewire-pulse \
  bluez bluez-utils brightnessctl \
  ttf-cascadia-code-nerd ttf-cascadia-mono-nerd \
  ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd \
  ttf-iosevka-nerd ttf-iosevkaterm-nerd \
  ttf-jetbrains-mono-nerd ttf-jetbrains-mono \
  ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
  nwg-look qt5ct qt6ct kvantum thunar fastfetch

# Install AUR packages
echo "Installing AUR packages..."
yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

# Update user directories
echo "Setting up user directories..."
xdg-user-dirs-update

# Extract themes and icons
echo "Installing themes and icons..."
THEME_SRC="/home/$USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz"
ICON_SRC="/home/$USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz"

sudo tar -xf "$THEME_SRC" -C /usr/share/themes/
sudo tar -xf "$ICON_SRC" -C /usr/share/icons/"
# Copy config files
echo "Copying configuration files..."
CONFIG_SRC="/home/$USER/hypr-dots/config"
cp -r "$CONFIG_SRC"/* "/home/$USER/.config/"

# Clone wallpapers
mkdir -p /home/$SUDO_USER/Pictures/walls/"
echo "Setting up wallpapers..."
WALLPAPER_DIR="/home/$SUDO_USER/Pictures/walls/catppuccin"
sudo -u "$SUDO_USER" git clone https://github.com/orangci/walls-catppuccin-mocha.git "$WALLPAPER_DIR"


sudo chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config/
sudo chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/Pictures/walls/catppuccin



echo "Installation completed successfully"
