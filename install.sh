#!/usr/bin/env bash

clear
echo "🚀 Akbar's dotfiles - arch dev environment"

# Take inputs from the user
read -p "Do you want to copy dotfiles ([y]es/[n]o): " stow_confirmation
read -p "Do you want to install base pkgs ([y]es/[n]o) : " base_pkgs
read -p "Do you want to install hyprland ([y]es/[n]o) : " hyprland
read -p "Do you want to install dev pkgs (y/n): " devpkgs
read -p "Do you want to install nvim pkgs (y/n): " nvimpkgs

# Stow configs with backing it up
if [ "$stow_confirmation" = "y" ]; then
    for cfg_path in "$HOME/dotfiles/.config/"*; do
        cfg=$(basename "$cfg_path")
        if [ -d "$HOME/.config/$cfg" ]; then
            mv "$HOME/.config/$cfg" "$HOME/.config/$cfg.bak"
        fi
    done
    stow .
    echo "👍 Successfully copied configs"
fi

PACKAGES=(
    fastfetch
    fish
    kitty
    starship
    tmux
    btop
    htop
    eza
    bat
)

HYPR=(
    hyprland
    xdg-desktop-portal-hyprland
    nwg-look
    adw-gtk-theme
    papirus-icon-theme
    pcmanfm
    noctalia
)

if [ "$base_pkgs" == "y" ]; then
    for pkg in ${PACKAGES[@]}; do
        sudo pacman -S --noconfirm --needed ${pkg}
    done
fi

if [ "$hyprland" == "y" ]; then
    for pkg in ${HYPR[@]}; do
        sudo pacman -S --noconfirm --needed ${pkg}
    done
fi

DEV_PKGS=(
    zed
    neovim
    npm
    fd
    fzf
    ripgrep
    zoxide
)

if [ $devpkgs == "y" ]; then
    for pkg in ${DEV_PKGS[@]}; do
        sudo pacman -S --noconfirm --needed ${pkg}
    done
fi

NVIM_PKGS=(
    neovim
    tree-sitter
    tree-sitter-grammars
    git
    base-devel
    ripgrep
    fd
    fzf
    unzip
    pyright
    ruff
    lua-language-server
    stylua
    clang
    rust-analyzer
    rustfmt
    vscode-html-languageserver
    vscode-css-languageserver
    prettier
    typescript
    typescript-language-server
    npm
)

if [ $nvimpkgs == "y" ]; then
    for pkg in ${NVIM_PKGS[@]}; do
        sudo pacman -S --noconfirm --needed ${pkg}
    done

    NVIM_DIR="$HOME/.config/nvim"
    if [ -d "$NVIM_DIR" ]; then
        echo "ℹ️  Directory $NVIM_DIR already exists. Skipping git clone."
    else
        echo "📥 Cloning Neovim configuration into $NVIM_DIR..."
        git clone https://github.com/akbarahmedjonov/nvim "$NVIM_DIR"
    fi
fi
