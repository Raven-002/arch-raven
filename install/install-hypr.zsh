#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
mkdir -p ~/.config
ln -srT "$INSTALLER_DIR/config/hypr" "$HOME/.config/hypr"
mkdir -p ~/.config/xdg-desktop-portal
ln -srT "$INSTALLER_DIR/config/hypr/hyprland-portals.conf" "$HOME/.config/xdg-desktop-portal/hyprland-portals.conf"
