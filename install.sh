#!/bin/sh

yay -S stow noctalia-shell papirus-icon-theme adw-gtk-theme cava btop vscodium vscodium-marketplace fish hyprland hypridle hyprsunset wlsunset kitty neovim vim nwg-look yazi ttf-jetbrains-mono-nerd
rm -rf ~/.config/btop ~/.config/cava ~/.config/Code ~/.config/fish ~/.config/gtk-3.0/ ~/.config/gtk-4.0/ ~/.config/htop ~/.config/hypr ~/.config/kitty ~/.config/noctalia/ ~/.config/nvim/ ~/.config/nwg-look/ ~/.config/qt5ct/ ~/.config/qt6ct/ ~/.config/VSCodium/ ~/.config/yazi/
stow .
