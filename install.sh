#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Required packages from official repos
sudo pacman -S --noconfirm \
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

# AUR packages (requires yay)
yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

# Update user directories (Downloads, Documents, etc.)
xdg-user-dirs-update

# Extract themes and icons
THEME_SRC="/home/$SUDO_USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz"
ICON_SRC="/home/$SUDO_USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz"

if [[ -f "$THEME_SRC" ]]; then
  sudo tar -xf "$THEME_SRC" -C /usr/share/themes/
else
  echo "❌ Theme archive not found: $THEME_SRC"
fi

if [[ -f "$ICON_SRC" ]]; then
  sudo tar -xf "$ICON_SRC" -C /usr/share/icons/
else
  echo "❌ Icon archive not found: $ICON_SRC"
fi

# Enable PipeWire services for the current user
systemctl --user enable --now pipewire pipewire-pulse wireplumber

# Copy config files
CONFIG_SRC="/home/$USER/hypr-dots/config"
if [[ -d "$CONFIG_SRC" ]]; then
  cp -r "$CONFIG_SRC"/* "$HOME/.config/"
else
  echo "❌ Config directory not found: $CONFIG_SRC"
fi

# Clone wallpaper repo
mkdir -p ~/Pictures/walls/
if [[ ! -d ~/Pictures/walls/catppuccin ]]; then
  git clone https://github.com/orangci/walls-catppuccin-mocha.git ~/Pictures/walls/catppuccin
fi

echo "✅ DONE"

