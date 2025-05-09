#!/usr/bin/env bash
cd "$(dirname "$0")"
sudo pacman -S --noconfirm xdg-user-dirs foot hyprland swww hyprlock hyprpicker dunst waybar fish tar nvim xdg-desktop-portal-hyprland hyprpolkitagent qt5-wayland qt6-wayland cliphist pipewire wireplumber pipewire-audio pipewire-pulse bluez bluez-utils brightnessctl ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono nwg-look qt5ct qt6ct kvantum thunar fastfetch

yay -S --noconfirm thorium-browser-bin tofi wlogout grimblast kvantum-theme-catppuccin-git

xdg-user-dirs-update

sudo tar -xvf /home/$SUDO_USER/hypr-dots/assets/themes/Catppuccin-Mocha.tar.xz -C /usr/share/themes/
sudo tar -xvf /home/$SUDO_USER/hypr-dots/assets/icons/Tela-circle-dracula.tar.xz -C /usr/share/icons/

cp -r /home/$USER/hypr-dots/config/* /home/$USER/.config/
fish_config theme save "Catppuccin Mocha"
