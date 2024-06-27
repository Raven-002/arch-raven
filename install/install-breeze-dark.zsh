#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
mkdir -p ~/.config
ln -srT "$INSTALLER_DIR/config/gtk/gtk-3.0" "$HOME/.config/gtk-3.0"
ln -srT "$INSTALLER_DIR/config/gtk/gtk-4.0" "$HOME/.config/gtk-4.0"
ln -srT "$INSTALLER_DIR/config/gtk/gtkrc" "$HOME/.config/gtkrc"
ln -srT "$INSTALLER_DIR/config/gtk/gtkrc-2.0" "$HOME/.config/gtkrc-2.0"

ln -srT "$INSTALLER_DIR/config/qt/kdeglobals" "$HOME/.config/kdeglobals"
ln -srT "$INSTALLER_DIR/config/qt/qt5ct" "$HOME/.config/qt5ct"
ln -srT "$INSTALLER_DIR/config/qt/qt6ct" "$HOME/.config/qt6ct"
