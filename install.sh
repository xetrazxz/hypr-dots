#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Check if running as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root" 
    exit 1
fi

# Install official packages
echo "Installing system packages..."
pacman -S --noconfirm \
  xdg-user-dirs foot hyprland swww hyprlock hyprpicker dunst waybar fish tar nvim \
  xdg-desktop-portal-hyprland hyprpolkitagent \
  qt5-wayland qt6-wayland cliphist \
  pipewire wireplumber pipewire-audio pipewire-pulse \
  bluez bluez-utils brightnessctl \
  ttf-cascadia-code-nerd ttf-cascadia-mono-nerd \
  ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd \
  ttf-iosevka-nerd ttf-iosevkaterm-nerd \
  ttf-jetbrains-mono-nerd ttf-jetbrains-mono \
  ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
  nwg-look qt5ct qt6ct kvantum thunar fastfetch

# Install AUR packages
echo "Installing AUR packages..."
sudo -u "$SUDO_USER" yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

# Update user directories
echo "Setting up user directories..."
sudo -u "$SUDO_USER" xdg-user-dirs-update

# Extract themes and icons
echo "Installing themes and icons..."
THEME_SRC="/home/$SUDO_USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz"
ICON_SRC="/home/$SUDO_USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz"

[ -f "$THEME_SRC" ] && tar -xf "$THEME_SRC" -C /usr/share/themes/ || echo "Theme archive not found: $THEME_SRC"
[ -f "$ICON_SRC" ] && tar -xf "$ICON_SRC" -C /usr/share/icons/ || echo "Icon archive not found: $ICON_SRC"

# Enable PipeWire for user
echo "Configuring PipeWire..."
sudo -u "$SUDO_USER" systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Copy config files
echo "Copying configuration files..."
CONFIG_SRC="/home/$SUDO_USER/hypr-dots/config"
[ -d "$CONFIG_SRC" ] && sudo -u "$SUDO_USER" cp -r "$CONFIG_SRC"/* "/home/$SUDO_USER/.config/" || echo "Config directory not found: $CONFIG_SRC"

# Clone wallpapers
mkdir -p /home/$SUDO_USER/Pictures/walls/"
echo "Setting up wallpapers..."
WALLPAPER_DIR="/home/$SUDO_USER/Pictures/walls/catppuccin"
[ ! -d "$WALLPAPER_DIR" ] && sudo -u "$SUDO_USER" git clone https://github.com/orangci/walls-catppuccin-mocha.git "$WALLPAPER_DIR"


sudo chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/.config/
sudo chown -R $SUDO_USER:$SUDO_USER /home/$SUDO_USER/Pictures/walls/catppuccin



echo "Installation completed successfully"
