#!/bin/zsh

set -e

INSTALLER_DIR="${0:a:h}/.."
source "$INSTALLER_DIR/zsh-utils.zsh"

# *** Script *********************************************
mkdir -p ~/.config
if yes_no_prompt "Configure gtk Breeze dark?"; then
    ln -srT "$INSTALLER_DIR/config/gtk/gtk-3.0" "$HOME/.config/gtk-3.0"
    ln -srT "$INSTALLER_DIR/config/gtk/gtk-4.0" "$HOME/.config/gtk-4.0"
    ln -srT "$INSTALLER_DIR/config/gtk/gtkrc" "$HOME/.config/gtkrc"
    ln -srT "$INSTALLER_DIR/config/gtk/gtkrc-2.0" "$HOME/.config/gtkrc-2.0"
fi

if yes_no_prompt "Configure qt breeze dark?"; then
    ln -srT "$INSTALLER_DIR/config/qt/kdeglobals" "$HOME/.config/kdeglobals"
    ln -srT "$INSTALLER_DIR/config/qt/qt5ct" "$HOME/.config/qt5ct"
    ln -srT "$INSTALLER_DIR/config/qt/qt6ct" "$HOME/.config/qt6ct"
fi

if yes_no_prompt "Install breeze dracula cursor?"; then
    _TMP_THEME_DIR="/tmp/dracula-cursor-build.tmp"
    mkdir -p "$HOME/.local/share/icons"
    mkdir "$_TMP_THEME_DIR"

    git clone git@github.com:dracula/gtk.git "$_TMP_THEME_DIR/dracula-gtk"
    rm -rf "$HOME/.local/share/icons/Breeze-Dracula"
    cp -r "$_TMP_THEME_DIR/dracula-gtk/kde/cursors/Dracula-cursors" "$HOME/.local/share/icons/Breeze-Dracula"

    git clone https://github.com/guillaumeboehm/hyprcursor_dracula_kde.git "$_TMP_THEME_DIR/hyprcursor_dracula_kde"
    hyprcursor-util --create "$_TMP_THEME_DIR/hyprcursor_dracula_kde" -o "$HOME/.local/share/icons"

    rm -rf "$_TMP_THEME_DIR"
fi

if yes_no_prompt "Configure flatpak (qt does not work well)?"; then
    flatpak override --user --filesystem=xdg-config/gtk-4.0:ro
    flatpak override --user --filesystem=xdg-config/gtk-3.0:ro
    flatpak override --user --filesystem=xdg-config/gtk-2.0:ro
    flatpak override --user --filesystem=xdg-config/gtkrc-2.0:ro
    flatpak override --user --filesystem=xdg-config/gtkrc:ro

    flatpak override --user --filesystem=xdg-config/qt6ct:ro
    flatpak override --user --filesystem=xdg-config/qt5ct:ro

    # for gtk4 mostly
    mkdir -p "$HOME/.themes"
    cp -r "/usr/share/themes/Breeze-Dark" "$HOME/.themes"
    flatpak override --user --filesystem=~/.themes:ro

    flatpak override --user --env=GTK_THEME=Breeze-Dark
    flatpak override --user --env=QT_QPA_PLATFORMTHEME=qt6ct
    flatpak override --user --env=QT_QPA_PLATFORM=wayland
    flatpak override --user --env=QT_STYLE_OVERRIDE=breeze
fi

if yes_no_prompt "Configure flatpak electron?"; then
    flatpak override --user --env=ELECTRON_OZONE_PLATFORM_HINT=auto
    flatpak override --user --socket=wayland
fi
